//
//  AddIncomeViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2022/1/4.
//

import UIKit


protocol AddIncomeDelegate {
    func addIncome(inc: Income)
}


class AddIncomeViewController: UIViewController {
     var delegate: AddIncomeDelegate?
    
    private var screenLayout = ScreenLayout()
    
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var descriptionTxtField: UITextField!
    @IBOutlet weak var amountTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenLayout.layoutView(view: textFieldView)
        screenLayout.setTextfieldBorder(txtfield: descriptionTxtField)
        descriptionTxtField.placeholderColor(UIColor.darkGray)
        amountTxtField.placeholderColor(UIColor.darkGray)
    }
    
    @IBAction func didPressCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressAdd(_ sender: Any) {
        
        guard let description = descriptionTxtField.text, descriptionTxtField.hasText else{
            print("Handle error here - no description")
            return
        }
        
        guard let amount = amountTxtField.text, amountTxtField.hasText else{
            print("Handle error here - no amount")
            return
        }
        
        let income = Income(amount: Double(amount)!, description: description)
        
        delegate?.addIncome(inc: income)
        
        self.dismiss(animated: true, completion: nil)

    }
    
}


