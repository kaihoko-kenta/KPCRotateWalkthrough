# KPCRotateWalkthrough

![language](https://img.shields.io/badge/Language-%20Swift%20-orange.svg)
[![CI Status](http://img.shields.io/travis/Kaihoko Kenta/KPCRotateWalkthrough.svg?style=flat)](https://travis-ci.org/Kaihoko Kenta/KPCRotateWalkthrough)
[![Version](https://img.shields.io/cocoapods/v/KPCRotateWalkthrough.svg?style=flat)](http://cocoapods.org/pods/KPCRotateWalkthrough)
[![License](https://img.shields.io/cocoapods/l/KPCRotateWalkthrough.svg?style=flat)](http://cocoapods.org/pods/KPCRotateWalkthrough)
[![Platform](https://img.shields.io/cocoapods/p/KPCRotateWalkthrough.svg?style=flat)](http://cocoapods.org/pods/KPCRotateWalkthrough)

<img src="./walkthrough.gif" alt="gifDemo" width="350">

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Swift 2.0

## Installation

KPCRotateWalkthrough is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "KPCRotateWalkthrough"
```

## Get Started

First of all, import this library.
```swift
import KPCRotateWalkthrough
```

prepare two UIView Array, one is fixed view the other is rotated view.

```swift
//view which is fixed,such as text.
var fixView: [UIView] = []
//view which rotates, such as Image.
var rotationView: [UIView] = []

let wtv = WalkThroughView(frame: self.view.frame, fixView: fixView, rotationView: rotationView)
self.view.addSubview(wtv)

```

##Example

```swift
self.view.backgroundColor = UIColor(red: 1/255, green: 143/255, blue: 100/255, alpha: 1.0)

let dh: CGFloat = self.view.frame.height
let dw: CGFloat = self.view.frame.width

let rotationFrame = CGRectMake(0, dh * 0.1, dw, dh * 0.7)
//rotationView factor
let firstImage = UIImageView(frame: rotationFrame)
firstImage.contentMode = .ScaleAspectFit
firstImage.image = UIImage(named: "first")
let secondImage = UIImageView(frame: rotationFrame)
secondImage.contentMode = .ScaleAspectFit
secondImage.image = UIImage(named: "second")
let thirdImage = UIImageView(frame: rotationFrame)
thirdImage.contentMode = .ScaleAspectFit
thirdImage.image = UIImage(named: "third")
rotationView.append(firstImage)
rotationView.append(secondImage)
rotationView.append(thirdImage)

let fixFrame = CGRectMake(50, dh * 0.8, dw - 100, dh * 0.2)
//fixView factor
let firstText = UILabel(frame: fixFrame)
firstText.text = "The text of first view. \nThis text is not rotatable"
firstText.textColor = UIColor.whiteColor()
firstText.numberOfLines = 0
firstText.textAlignment = .Center
let secondText = UILabel(frame: fixFrame)
secondText.text = "The text of second view. \nSmooth rotation will contribute to user's high grade UX"
secondText.textColor = UIColor.whiteColor()
secondText.numberOfLines = 0
secondText.textAlignment = .Center
let thirdText = UILabel(frame: fixFrame)
thirdText.text = "The text of third view. \nIf you like, please star me. \nThis Library was developed for Channel on AppStore"
thirdText.textColor = UIColor.whiteColor()
thirdText.numberOfLines = 0
thirdText.textAlignment = .Center
fixView.append(firstText)
fixView.append(secondText)
fixView.append(thirdText)

//Call WalkThroughView
let wtv = WalkThroughView(frame: self.view.frame, fixView: fixView, rotationView: rotationView)
self.view.addSubview(wtv)


```


## Author

Chotchy,inc CEO(http://chotchy.net)<br>
Kaihoko Kenta<br>
Twitter(http://twitter.com/umipocoken)<br>


## License

KPCRotateWalkthrough is available under the MIT license. See the LICENSE file for more info.
