# Swift Conventions and Style Guide.

The goals for this Swift Style Guide are to encourage readable and concise swift code.

## Introduction
This guide is just a guideline and should not force a particular coding style.
Any violation to the guide is allowed if it enhances readability and conciseness. 
Here are some of the documents that informed the style guide. 
* [Github swift style guide](https://github.com/github/swift-style-guide)
* [raywenderlich.com Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)

## Table of Contents
* [Spacing](#Spacing)
* [Braces](#Braces)






## Spacing
* Indent using 2 spaces rather than tabs 
* Spaces conserve space and help prevent line wrapping.
* Be sure to set this preference in Xcode.


## Braces
Method braces and other braces (if/else/switch/while etc.) 
always open on the same line as the statement but close on a new line.
Use 2 spaces, opening brace on same line
```swift
if true {
    //Do something
} else {
    //Do something else
}
```