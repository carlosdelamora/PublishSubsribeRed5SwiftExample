//
//  PublishViewController.swift
//  PublishSubsribeRed5SwiftExample
//
//  Created by Carlos De la mora on 4/24/18.
//  Copyright © 2018 carlosdelamora. All rights reserved.
//

import UIKit
import R5Streaming
class PublishViewController: R5VideoViewController, R5StreamDelegate {
  
  var config: R5Configuration? = nil
  var publishStream: R5Stream? = nil
  static let srotyboardId = "publishViewController"
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    config = getConfiguration()
    AVAudioSession.sharedInstance().requestRecordPermission { (gotPerm:Bool)-> Void in
      
    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    DispatchQueue.main.async {
      self.preview()
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    stop()
  }
  
  func getConfiguration()-> R5Configuration{
    let configuration = R5Configuration()
    configuration.host = Constants.Config.host
    configuration.port = 8554
    configuration.contextName = "live"
    configuration.`protocol` = 1;
    configuration.buffer_time = 0.5
    configuration.licenseKey = Constants.Config.licenseKey
    return configuration
  }
  
  func preview(){
    // Video
    let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front)
    let camera = R5Camera(device: videoDevice, andBitRate: 750)
    //camera?.width = 640
    //camera?.height = 360
    //camera?.orientation = 90
    //audio
    let audioDevice = AVCaptureDevice.default(for: AVMediaType.audio)
    let microphone = R5Microphone(device: audioDevice)
    //microphone?.bitrate = 32
    //microphone?.device = audioDevice;
    
    //create the stream
    let connection = R5Connection(config: config)
    publishStream = R5Stream(connection: connection)
    publishStream!.attachVideo(camera)
    publishStream!.attachAudio(microphone)
    publishStream!.delegate = self
    attach(publishStream)
    showPreview(true)
  }
  
  func start(){
    DispatchQueue.main.async {
      self.showPreview(false)
      self.publishStream!.publish("stream1", type: R5RecordTypeLive)
    }
    
  }
  
  func stop(){
    DispatchQueue.main.async {
      self.publishStream?.stop()
      self.publishStream?.delegate = nil
      self.preview()
    }
  }
  
  //the delegate
  func onR5StreamStatus(_ stream: R5Stream!, withStatus statusCode: Int32, withMessage msg: String!) {
    NSLog("Status: %s ", r5_string_for_status(statusCode))
  }
  
}
