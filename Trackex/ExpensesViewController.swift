//
//  ExpensesViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit

class ExpensesViewController: UIViewController {

    
    @IBOutlet weak var chartView: UIView!
    
    @IBOutlet weak var foodExpenseButton: UIButton!
    @IBOutlet weak var homeExpenseButton: UIButton!
    @IBOutlet weak var billExpenseButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutDesign()
        print("Expenses from viewDidLoad")
    }
    

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Expenses"
    }

    
    private func layoutDesign(){
        chartView.layer.cornerRadius = 5
        addButton.layer.cornerRadius = addButton.bounds.size.height / 2
        foodExpenseButton.layer.cornerRadius = 5
        homeExpenseButton.layer.cornerRadius = 5
        billExpenseButton.layer.cornerRadius = 5
    }

}
