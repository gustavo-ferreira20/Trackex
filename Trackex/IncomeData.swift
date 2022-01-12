//
//  IncomeData.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2022/1/12.
//

import Foundation
import RealmSwift

class IncomeData: Object {
   @objc dynamic var desc: String = ""
   @objc dynamic var amount: Double = 0
}
