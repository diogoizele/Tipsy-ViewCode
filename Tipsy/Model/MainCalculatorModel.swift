//
//  MainCalculatorViewModel {.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

class MainCalculatorModel {
    
    var billTotal: String = ""
    var tipPercentage: Double = 0.0
    
    func updateBillTotal(_ newBillTotal: String) {
        billTotal = newBillTotal
    }
}
