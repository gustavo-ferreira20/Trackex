//
//  ExpensesViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit

class ExpensesViewController: UIViewController {
    private var screenLayout = ScreenLayout()

    
    @IBOutlet weak var chartView: UIView!
    
    @IBOutlet weak var foodExpenseButton: UIButton!
    @IBOutlet weak var homeExpenseButton: UIButton!
    @IBOutlet weak var billExpenseButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenLayout.layoutDesignExpenses(view: chartView, button1: foodExpenseButton, button2: homeExpenseButton, button3: billExpenseButton)
        screenLayout.layoutDesign(button: addButton)
        print("Expenses from viewDidLoad")
    }
    

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Expenses"
    }
    
    
    
    @IBAction func didPressAddButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ExpensesAddButtonClicked", sender: self)
    }
    
}
