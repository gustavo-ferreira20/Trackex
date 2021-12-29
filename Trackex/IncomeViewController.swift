//
//  IncomeViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit

class IncomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Income from viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Income"
        print("Income from viewWillAppear")
    }

 
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Income from viewWillDisappear")
    }

}
