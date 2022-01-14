//
//  Expense.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2022/1/14.
//

import Foundation
import RealmSwift

class Expense: Object {
    
    @Persisted var desc: String
    @Persisted var amount: Double
    @Persisted var image: String
    
    convenience init(desc : String, amount : Double, image: String) {
        self.init()
        
        self.desc = desc
        self.amount = amount
        self.image = image
    }
}
