//
//  ViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit

class HomepageViewController: UIViewController {
    
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var netIncomeLabel: UILabel!
    @IBOutlet weak var expensesLabel: UILabel!
    
    @IBOutlet weak var netView: UIView!
    @IBOutlet weak var expensesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Homepage from viewDidLoad")
        uiLayout()
    }
    

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Trackex"
        
    }
 
    
    private func uiLayout(){
        netView.layer.cornerRadius = 25
        expensesView.layer.cornerRadius = 25
    }


}
