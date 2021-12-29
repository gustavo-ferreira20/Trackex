//
//  ViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit

class HomepageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Homepage from viewDidLoad")
    }
    

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Trackex"
        
    }
 


}
