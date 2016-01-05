# Swift Conventions and Style Guide.

The goals for this Swift Style Guide are to encourage readable and concise swift code.

## Introduction
This guide is just a guideline and should not force a particular coding style.
Any violation to the guide is allowed if it enhances readability and conciseness. 


## Table of Contents
* [Spacing](#spacing)
* [Comments](#comments)
* [Braces](#braces)
* [Naming Types](#naming-types)
* [Naming Variables and Constants](#naming-variables-and-constants)
* [Naming Swift Modules](#naming-swift-modules)
* [Function Declarations](#function-declarations)
* [Use self sparingly](#use-self-sparingly)
* [Closures Declarations](#closures-declarations)
* [Code Organization](#code-organization)
* [ Well-styled class definition example](#well-styled-class-definition-example)
* [Reference](#reference)

## Spacing
* Indent using 2 spaces rather than tabs. 
* Spaces conserve space and help prevent line wrapping.
* Be sure to set this preference in Xcode.


## Comments 
* Comments should describe Why NOT What. Why the code is implemented in a particular way.
* Comments should be current and relevant to explaining why.

```swift
//does Some Stuff because there is stuff to do
func doSomeStuff(){
    
}
```

Use comments to explain WHY a particular piece of code does something. 
Type and member names should provide the What. They should be nouns or verbs.

## Braces
* Method braces and other braces (if/else/switch/while etc.) 
* Always open on the same line as the statement but close on a new line.
* Use 2 spaces, opening brace on same line.
```swift
if true {
    //Do something
} else {
    //Do something else
}
```

## Naming Types
* Use descriptive names with camel case for classes, methods, variables, etc. 
* Class names and constants in module scope should be capitalized.
* Method names and variables should start with a lower case letter.
* Use Pascal Case for Classes, Structs, Enumerations.
* You should not add prefixes to your Swift type names.

```swift
class SomeClass {
    // class definition goes here
}

struct SomeStructure {
    // structure definition goes here
}

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    println("The remembered direction is still .West")
}
// prints "The remembered direction is still .West"
```

## Naming Variables and Constants
* Use Camel Case for methods, functions, variables and constants.
```swift
//code
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

class Counter {
    var count = 0
    func increment() {
        count++
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
```

## Naming Swift Modules
* Use Pascal Case for modules.
* Namespacing is implicit in swift.
* No class prefixes needed.

Swift Module names are Pascal Case.
All classes (etc) are implicitly scoped by the module (Xcode target) they are in.
Unlike Objective-C No class prefixes are needed. 
Namespaces are not per-file. They're per-target (based on the "Product Module Name" build setting).
```swift
// Pascal Case for modules
import FrameworkA
import FrameworkB

//using type in framework
FrameworkA.foo()
```

## Function Declarations
* Short function declarations on one line including the opening brace.
* For functions with long signatures, add line breaks at appropriate points.


Keep short function declarations on one line including the opening brace:
```swift
var isSomeStuff:Bool = true

func reticulateSplines(spline: [Double]) -> Bool {
    // reticulate code goes here
    return isSomeStuff
}
```

For functions with long signatures, add line breaks at appropriate points 
and add an extra indent on subsequent lines:
```swift
func reticulateSplines(spline: [Double], adjustmentFactor: Double,
    translateConstant: Int, comment: String) -> Bool {
        // reticulate code goes here
           return isSomeStuff
}
```

## Use self sparingly
Use self when required to differentiate between property names and arguments
in initializers, and when referencing properties in closures
to make capture semantics explicit.
```swift
    init(x: Int, y: Int, radius: Double) {
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    convenience init(x: Int, y: Int, diameter: Double) {
        self.init(x: x, y: y, radius: diameter / 2)
    }
    
    func describe() -> String {
        return "I am a circle at \(centerString()) with an area of \(computeArea())"
    }
    
    func computeArea() -> Double {
        return M_PI * radius * radius
    }
    
    private func centerString() -> String {
        return "(\(x),\(y))"
    }
}
```
## Closures Declarations
* Use trailing closure syntax wherever possible.
* Give the closure parameters descriptive name.
* For single-expression closures where the context is clear, use implicit returns.

Use trailing closure syntax wherever possible. 
In all cases, give the closure parameters descriptive names:
```swift
return SKAction.customActionWithDuration(effect.duration) { node, elapsedTime in
    // more code goes here
}
```
For single-expression closures where the context is clear, use implicit returns:
```swift
attendeeList.sort { a, b in
    a > b
}
```

## Code Organization
 * Use // MARK: -  to categorize methods in functional groupings and protocol/delegate 
 implementations. It is similar to #pragma mark - 
 * Use FIXME and TODO when you need to set a reminder for code that you need to revisit.
 
 // MARK: is used to divide functionality into meaningful, easy-to-navigate sections. As 
 with #pragma, MARK followed by a single dash (-) will be preceded with a horizontal divider)
 ```swift
// MARK: Circle class
class Circle: Shape {
    var x: Int, y: Int
    // MARK: radius
    var radius: Double
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
 ```
 Both //TODO: and // FIXME:  references can appear at different levels – 
 ```swift
 // FIXME: inherit from parent
class Circle {
// TODO: add super class
    var x: Int, y: Int
    var radius: Double
    var diameter: Double {
        get {
        // FIXME: bug 1001 fix multiplier
            return radius * 21
        }
        set {
        // TODO: check error margin
            radius = newValue / 2.1
        }
    }
 ```
 
## Well-styled class definition example:
An example of a well-styled class definition:
```swift
class Shape {
    // class definition goes here
}
class Circle: Shape {
    var x: Int, y: Int
    var radius: Double
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
 ```
 
 
## Reference
 Here are some of the documents that informed this code style guide:
 
* [Github swift style guide](https://github.com/github/swift-style-guide)
* [raywenderlich.com Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)
* [The Sport Ngin Swift Style Guide](http://sportngin.github.io/styleguide/objective-c.html)
* [Another Swift Style Guide](https://github.com/netguru/swift-style-guide)
* [Language Guide](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309)

