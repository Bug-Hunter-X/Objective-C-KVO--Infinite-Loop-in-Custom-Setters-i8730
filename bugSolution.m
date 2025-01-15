```objectivec
#import "MyClass.h"

@implementation MyClass
- (void)setName:(NSString *)newName {
    [self willChangeValueForKey:@"name"];
    [self willChangeValueForKey:@"fullName"]; //Important: Notify KVO before changes
    _name = newName;
    self.fullName = [NSString stringWithFormat:@"%@ LastName", newName];
    [self didChangeValueForKey:@"fullName"];
    [self didChangeValueForKey:@"name"]; //Important: Notify KVO after changes
}

- (void)setFullName:(NSString *)newFullName {
    [self willChangeValueForKey:@"fullName"];
    _fullName = newFullName;
    // ... other code that doesn't unintentionally change name...
    [self didChangeValueForKey:@"fullName"];
}
@end
```
By explicitly using `willChangeValueForKey:` and `didChangeValueForKey:` before and after the changes, we can ensure that changes in the setter methods trigger only the expected KVO updates.