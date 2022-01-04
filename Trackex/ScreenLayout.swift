//
//  ButtonLayout.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2022/1/4.
//

import Foundation
import UIKit

struct ScreenLayout{
    
    func layoutDesign(button: UIButton!){
        button.layer.cornerRadius = button.bounds.size.height / 2
    }
    
    
    func layoutDesignExpenses(view: UIView!, button1: UIButton!, button2: UIButton!, button3: UIButton!){
        view.layer.cornerRadius = 5
        button1.layer.cornerRadius = 5
        button2.layer.cornerRadius = 5
        button3.layer.cornerRadius = 5
    }

}
