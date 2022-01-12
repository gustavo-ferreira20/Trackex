//
//  Income.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2022/1/10.
//

import Foundation
import RealmSwift

class Income: Object {
    
    @Persisted var desc: String
    @Persisted var amount: Double
    
   convenience init(desc : String, amount : Double) {
        self.init()
        
        self.desc = desc
        self.amount = amount
    }
}
