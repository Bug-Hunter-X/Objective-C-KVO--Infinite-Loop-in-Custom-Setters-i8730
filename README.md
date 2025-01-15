# Objective-C KVO Infinite Loop Bug

This repository demonstrates a potential infinite loop bug in Objective-C when using Key-Value Observing (KVO) with custom setters.  The bug occurs when a setter modifies other properties that also have observers, leading to recursive calls and potential stack overflows.

## Bug Description

The `bug.m` file contains an example of a class with two properties, `name` and `fullName`. The `setName:` method updates both properties.  If the change to `fullName` indirectly affects `name`, a recursive loop is initiated.

## Solution

The `bugSolution.m` file provides a solution using `willChangeValueForKey:` and `didChangeValueForKey:` to manage KVO updates. During property modification, KVO is temporarily disabled. 

## How to Reproduce

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the application.  Observe the error messages in the console (or lack thereof).