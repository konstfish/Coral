<div align="center">
    <br />
    <img src="./etc/logo512.png" alt="Coral Logo" width="150"/>
    <h1>Coral</h1>
    <h3>Minimalist PDF Viewer for macOS built for LaTeX</h3>
</div>

<div align="center">

[![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/konstfish/Coral/blob/master/LICENSE)
[![Swift 5](https://img.shields.io/badge/swift-5-orange.svg?style=flat)](https://github.com/apple/swift)
[![Platform](http://img.shields.io/badge/platform-macOS-red.svg?style=flat)](https://developer.apple.com/macos/)

</div>

## Demo

Example Workflow:

![workflow](etc/screenshots/demo.gif)

## Functionality

 - Hot Reloading PDF Files on Change
 - Highlight Text
 - Hide/Show Titlebar
 - Hide/Show PDF Thumbnails
 - Clean Interface

## TODO

 - [ ] Add Apples Script Support
 - [ ] Fix Black Bar from Split View
 - [x] Highlight Text
 - [ ] Save Highlighted Text
 - [ ] Complete util script

## Scripting Support

TODO

```applescript
tell application "Coral"
    open "file.pdf"
end tell
```

## Setup

1. run: `carthage update`

2. Compile in Xcode
