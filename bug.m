In Objective-C, a subtle bug can occur when using KVO (Key-Value Observing) with custom setters. If a setter modifies other properties that also have observers, it can trigger infinite loops or unexpected behavior.  Consider this example:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@end

@implementation MyClass
- (void)setName:(NSString *)newName {
    _name = newName;
    self.fullName = [NSString stringWithFormat:@"%@ LastName", newName]; // This calls the fullName setter
}

- (void)setFullName:(NSString *)newFullName {
    _fullName = newFullName;
    // ... some other code that might also trigger a change in 'name' or 'fullName'...
}
@end
```

If `setName:` is called, it sets `name` and then calls `setFullName:`.  If `setFullName:`'s actions indirectly change `name`, `setName:` would be called again recursively. This might lead to a stack overflow or other unpredictable results. 