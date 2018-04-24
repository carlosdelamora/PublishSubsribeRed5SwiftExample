//
//  SubscribeViewController.swift
//  PublishSubsribeRed5SwiftExample
//
//  Created by Carlos De la mora on 4/24/18.
//  Copyright © 2018 carlosdelamora. All rights reserved.
//

import UIKit
import R5Streaming

class SubsrcibeViewController: R5VideoViewController {
  
  var config:R5Configuration?
  var stream: R5Stream?
  static let storyboardId = "SubscribeViewController"
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    config = R5Configuration()
    guard let config = config else{
      return
    }
    config.host = Constants.Config.host//maybe localhost
    config.port = 8554
    config.contextName = "live"
    config.licenseKey = Constants.Config.licenseKey
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    stop()
  }
  
  func start(){
    let connection = R5Connection(config: config!)
    stream = R5Stream(connection: connection!)
    attach(stream)
    stream?.play("stream1")
  }
  
  func stop(){
    stream?.stop()
  }
}
