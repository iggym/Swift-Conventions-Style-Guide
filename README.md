# Swift Conventions and Style Guide.

The goals for this Swift Style Guide are to encourage readable and concise swift code.

## Introduction
This guide is just a guideline and should not force a particular coding style.
Any violation to the guide is allowed if it enhances readability and conciseness. 
Here are some of the documents that informed the style guide. 
* [Github swift style guide](https://github.com/github/swift-style-guide)
* [raywenderlich.com Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)

## Table of Contents
* [Spacing](#spacing)
* [Comments](#comments)
* [Braces](#braces)
* [Naming Types](#naming-types)
* [Naming Variables and Constants](#naming-variables-and-constants)
* [Naming Swift Modules](#naming-swift-modules)
* [Function Declarations](#function-declarations)








## Spacing
* Indent using 2 spaces rather than tabs 
* Spaces conserve space and help prevent line wrapping.
* Be sure to set this preference in Xcode.


## Comments 
* Comment Why NOT What
* Comments should be current and relevant to explaining why

```swift
//does Some Stuff because there is stuff to do
func doSomeStuff(){
    
}
```

Use comments to explain WHY a particular piece of code does something. 
Type and member names should provide What, nouns and verbs

## Braces
* Method braces and other braces (if/else/switch/while etc.) 
* Always open on the same line as the statement but close on a new line.
* Use 2 spaces, opening brace on same line
```swift
if true {
    //Do something
} else {
    //Do something else
}
```

## Naming Types
* Use descriptive names with camel case for classes, methods, variables, etc. 
* Class names and constants in module scope should be capitalized, 
* Method names and variables should start with a lower case letter.
* Use Pascal Case for Classes, Structs, Enumerations
* You should not add prefixes to your Swift types.

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
* Use Camel Case for methods, functions, variables and constants
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
* Use Pascal Case for modules
* Namespacing is implicit in swift,
* No class prefixes needed

Swift Module names are Pascal Case.
All classes (etc) are implicitly scoped by the module (Xcode target) they are in.
no class prefixes needed. 
Namespaces are not per-file. 
They're per-target (based on the "Product Module Name" build setting).
```swift
// Pascal Case for modules
import FrameworkA
import FrameworkB

//using type in framework
FrameworkA.foo()
```

## Function Declarations
* short function declarations on one line including the opening brace
* For functions with long signatures, add line breaks at appropriate points
*

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