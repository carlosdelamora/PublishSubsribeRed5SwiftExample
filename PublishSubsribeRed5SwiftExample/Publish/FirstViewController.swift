//
//  FirstViewController.swift
//  PublishSubsribeRed5SwiftExample
//
//  Created by Carlos De la mora on 4/24/18.
//  Copyright © 2018 carlosdelamora. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
  var publishViewController: PublishViewController? = nil
  var isPublishing:Bool = false
  
  @IBOutlet weak var publishButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    publishViewController = (storyboard?.instantiateViewController(withIdentifier: PublishViewController.srotyboardId) as! PublishViewController)
    publishViewController?.view.layer.frame = view.bounds
    view.addSubview(publishViewController!.view)
    view.sendSubview(toBack: publishViewController!.view)
    publishViewController?.viewWillAppear(true)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    DispatchQueue.main.async {
      self.publishButton.setTitle("Stream", for: .normal)
    }
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    isPublishing = false
  }
  
  @IBAction func publishAction(_ sender: Any) {
    
    if isPublishing{
      publishViewController?.stop()
    }else{
      publishViewController?.start()
    }
    isPublishing = !isPublishing
    DispatchQueue.main.async {
      self.publishButton.setTitle(self.isPublishing ? "Stop": "Stream", for: .normal)
    }
  }
}
