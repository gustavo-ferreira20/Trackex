//
//  ExpensesViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit

class ExpensesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Expenses from viewDidLoad")
    }
    

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Expenses"
    }


}
