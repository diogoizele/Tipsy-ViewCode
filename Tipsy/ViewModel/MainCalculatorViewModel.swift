//
//  MainCalculatorViewModel.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

class MainCalculatorViewModel {
    
    var moneyAmount: Double = 0.0
    var selectedTip: Double = 0.1
    var peopleQuantity: Int = 2

    func tipChanged(with percentage: Double) {
        selectedTip = percentage
    }
    
    func peopleQuantityChanged(with amount: Int) {
        peopleQuantity = amount
    }
    
    func changeAmount(with amount: Double) {
        moneyAmount = amount
    }
    
    func calculateValue() -> Double {
        print("Selected Tip: \(selectedTip * 100)%")
        print("People quantity: \(peopleQuantity)")
        print("moneyAmount: \(moneyAmount)")
        
        let increasedPercentage = moneyAmount * (1 + selectedTip)
        let result = increasedPercentage / Double(peopleQuantity)
        
        return result
    }

}
