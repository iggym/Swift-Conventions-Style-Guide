// Playground - noun: a place where people can play
//See TODOs for code conventions or the preffered way
//see https://github.com/raywenderlich/swift-style-guide
//see https://github.com/github/swift-style-guide

import UIKit
//MARK: - Swift Style playground
var str = "Hello, Swift Style playground"
////////////////////////////////////////////////////////////////////////////////

//MARK: - Spacing - Spaces and opening braces
/*
Indent using 2 spaces rather than tabs
Spaces conserve space and help prevent line wrapping.
Be sure to set this preference in Xcode.
Method braces and other braces (if/else/switch/while etc.)
always open on the same line as the statement but close on a new line.
*/
// TODO: Use 2 spaces, opening brace on same line
if true {
    //Do something
} else {
    //Do something else
}
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Comments - Why NOT What
/*
Comments should be current and relevant to explaining why
*/
// TODO: Use comments to explain WHY a particular piece of code does something.
//does Some Stuff because there is stuff to do
func doSomeStuff(){
    
}
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Naming - Types and members
/*
Use descriptive names with camel case for classes, methods, variables, etc.
Class names and constants in module scope should be capitalized,
while method names and variables should start with a lower case letter.
*/
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Naming - Classes, structs and enumerations
/*
Use descriptive names with Pascal case for classes, structs and enumerations
*/
// TODO: Use Pascal Case for Classes, Structs, Enumerations
// TODO: You should not add prefixes to your Swift types.
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
    print("The remembered direction is still .West")
}
// prints "The remembered direction is still .West"
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Naming - Variables and Constants
/*
Use descriptive names with camel case for members i.e.
method names and variables should start with a lower case letter.
*/
// TODO: Use Camel Case for methods, functions, variables and constants
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

//MARK: - example of a well-styled class definition:
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
    //MARK: Use self sparingly
    //Use self when required to differentiate between property names and arguments
    //in initializers, and when referencing properties in closures
    // to make capture semantics explicit
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
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Function Declarations

//Keep short function declarations on one line including the opening brace:
var isSomeStuff:Bool = true

func reticulateSplines(spline: [Double]) -> Bool {
    // reticulate code goes here
    return isSomeStuff
}

//For functions with long signatures, add line breaks at appropriate points
//and add an extra indent on subsequent lines:

func reticulateSplines(spline: [Double], adjustmentFactor: Double,
    translateConstant: Int, comment: String) -> Bool {
        // reticulate code goes here
        return isSomeStuff
}

//////////////////////////////////////////////////////////////////////////////--

//MARK: - Closures Declarations

//Use trailing closure syntax wherever possible.
//In all cases, give the closure parameters descriptive names:
/*
return SKAction.customActionWithDuration(effect.duration) { node, elapsedTime in
// more code goes here
}
For single-expression closures where the context is clear, use implicit returns:

attendeeList.sort { a, b in
a > b
}
*/
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Types - use Swift's native types when available

//Preferred:
let width = 120.0                                    //Double
let widthString = (width as NSNumber).stringValue    //String

//Not Preferred:
let width1: NSNumber = 120.0                                 //NSNumber
let widthString1: NSString = width1.stringValue               //NSString
//In Sprite Kit code, use CGFloat if it makes the code more succinct by
//avoiding too many conversions.
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Optionals
//Declare variables and function return types as optional with ? where
//a nil value is acceptable.

//Use implicitly unwrapped types declared with ! only for instance variables
//that you know will be initialized later before use,
//such as subviews that will be set up in viewDidLoad.

//When accessing an optional value,
//use optional chaining if the value is only accessed once or
//if there are many optionals in the chain:
//myOptional?.anotherOne?.optionalView?.setNeedsDisplay()

//Use optional binding when it's more convenient to unwrap once
//and perform multiple operations:
var myView:UIView? =  UIView()

if let view = myView {
    // do many things with view
}
//////////////////////////////////////////////////////////////////////////////--


//MARK: - Struct Initializers
//TODO: - Use the native Swift struct initializers

//Use the native Swift struct initializers rather than
//the legacy CGGeometry constructors.

//Preferred:
let bounds = CGRect(x: 40, y: 20, width: 120, height: 80)
var centerPoint = CGPoint(x: 96, y: 42)

//Not Preferred:
let bounds1 = CGRectMake(40, 20, 120, 80)
var centerPoint1 = CGPointMake(96, 42)
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Type Inference
//TODO: - Prefer compact code let the compiler infer the type.
//The Swift compiler is able to infer the type of variables and constants.
//You can provide an explicit type via a type alias
//(which is indicated by the type after the colon),
//but in the majority of cases this is not necessary.

//Prefer compact code and let the compiler infer
//the type for a constant or variable.

//Preferred:
func computeViewBounds() -> CGRect{
    return CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0)
}

let message = "Click the button"
var currentBounds = computeViewBounds()

//Not Preferred:
let message1: String = "Click the button"
var currentBounds1: CGRect = computeViewBounds()

//////////////////////////////////////////////////////////////////////////////--

//MARK: - Generics syntax
//TODO: - Use shortcut versions of type declarations not the  generics syntax.
//Prefer the shortcut versions of type declarations over
//the full generics syntax.

//Preferred:
var deviceModels: [String]
var employees: [Int: String]
var faxNumber: Int?

//Not Preferred:
var deviceModels1: Array<String>
var employees1: Dictionary<Int, String>
var faxNumber1: Optional<Int>

//////////////////////////////////////////////////////////////////////////////--

//MARK: - Control Flow
//TODO: - the for-in style of for loop over the for-condition-increment style.
//Prefer the for-in style of for loop over the for-condition-increment style.

//Preferred:
var attendeeList = ["catfish", "water", "tulips", "blue paint"]

for _ in 0..<3 {
    print("Hello three times")
}

for person in attendeeList {
    // do something
}
//Not Preferred:
for var i = 0; i < 3; i++ {
    print("Hello three times")
}

for var i = 0; i < attendeeList.count; i++ {
    let person = attendeeList[i]
    // do something
}
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Language
//TODO: - Use US English spelling to match Apple's API.

//Preferred:
var color = "red"

//Not Preferred:
var colour = "red"
//////////////////////////////////////////////////////////////////////////////--

//MARK: - Swift Module names are Pascal Case

/*Namespacing is implicit in swift,
All classes (etc) are implicitly scoped by the module (Xcode target) they are in.
no class prefixes needed

Namespaces are not per-file;
they're per-target (based on the "Product Module Name" build setting).
*/
// TODO: Use Pascal Case for modules
//import FrameworkA
//import FrameworkB

//FrameworkA.foo()

//////////////////////////////////////////////////////////////////////////////--


//MARK: - Code Documentation formats -

//MARK: - Documentation formats - old
/**
Some function that does some stuff.

@param takes a string

@return returns anything.
*/
func someFunction(bar: String) -> AnyObject { return ""}

//MARK: - Documentation formats - new
/**
Some function that does some other stuff.

:param: takes a string param.

:returns: returns something, anything really.
*/
func someOtherFunction(bar: String) -> AnyObject { return "" }

////////////////////////////////////////////////////////////////////////////////
//MARK: - Glossary of Terms

//MARK: - Pascal case
/*The first letter in the identifier and
the first letter of each subsequent concatenated word are capitalized.
Use Pascal case for identifiers of three or more characters.
For example: BackColor, ShoeBox, FireFly, ViewManager*/

//MARK: - Camel case
/*The first letter of an identifier is lowercase and
the first letter of each subsequent concatenated word is capitalized.
For example:backColor, doSomeThing, someFunction*/

//upper camel case, a.k.a. PascalCase: ThisIsAnExample. thisIsNotAnExample.
//lower camel case: thisIsAnExample. ThisIsNotAnExample.

////////////////////////////////////////////////////////////////////////////////

print("End Playgroud")
