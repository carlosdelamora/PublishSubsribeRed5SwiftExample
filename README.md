#  iOS SDK Example using Swift 

I have created this document with the intention of give an example of how to publish and subscribe to a stream using the iOS SDK from red5Pro. 

## What you need 

This project assumes that you have installed and are able to run the red5pro SDK server. You will also need to download your own red5pro iOS SDK  and have an iOS SDK license key. 


## Usage

You need to go to finder and find the folder where you have the iOS SDK, then inside *streaming-ios*, open the folder *R5ProObjectiveCExamples*. Locate the R5streaming.framework and imported to the Xcode project. Xcode will prompt you with questions, select copy folders if need it and then add. 

Inside the Xcode project find the Constants.swift file and then write down you license key and your host IP address. Then you go to terminal and run  `sudo ./red5.sh`, enter your password and wait a few seconds and build and run the Xcode project. You can not publish a stream and see it form your localhost. You can install the app in another device and subscribe to the stream with the name "stream1".  

## Colaboration 

I am obviously not and expert on the red5pro iOS SDK, so you are welcome to fork it and send pullrequests.  


