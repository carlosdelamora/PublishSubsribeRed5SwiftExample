//
//  SecondViewController.swift
//  PublishSubsribeRed5SwiftExample
//
//  Created by Carlos De la mora on 4/24/18.
//  Copyright © 2018 carlosdelamora. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  var subscriber: SubsrcibeViewController? = nil
  var isSubscribing: Bool = false
  
  @IBOutlet weak var subscribeButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    subscriber = (storyboard?.instantiateViewController(withIdentifier: SubsrcibeViewController.storyboardId) as! SubsrcibeViewController)
    view.addSubview(subscriber!.view)
    view.sendSubview(toBack: subscriber!.view)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    DispatchQueue.main.async {
      self.subscribeButton.setTitle("Start", for: .normal)
    }
    
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    isSubscribing = false
  }
  
  @IBAction func subscribeButtonAction(_ sender: Any) {
    if isSubscribing{
      subscriber?.stop()
    }else{
      subscriber?.start()
    }
    isSubscribing = !isSubscribing
    DispatchQueue.main.async {
      self.subscribeButton.setTitle(self.isSubscribing ? "Stop": "Start", for: .normal)
    }
  }
  
  
}
