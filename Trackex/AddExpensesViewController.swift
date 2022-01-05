//
//  AddExpensesViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2022/1/4.
//

import UIKit

class AddExpensesViewController: UIViewController {
    
    private var screenLayout = ScreenLayout()
    
    
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenLayout.layoutDesignExpenses(view: textFieldView, button1: homeButton, button2: foodButton, button3: otherButton)
        screenLayout.layoutView(view: buttonsView)
        screenLayout.setTextfieldBorder(txtfield: descriptionTextField)
        descriptionTextField.placeholderColor(UIColor.darkGray)
        amountTextField.placeholderColor(UIColor.darkGray)
    }
    
    @IBAction func didPressAdd(_ sender: Any) {
    }
    
    @IBAction func didPressCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension UITextField {
    func placeholderColor(_ color: UIColor){
        var placeholderText = ""
        if self.placeholder != nil{
            placeholderText = self.placeholder!
        }
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
}
