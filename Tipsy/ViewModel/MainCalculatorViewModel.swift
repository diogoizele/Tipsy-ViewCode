//
//  MainCalculatorViewModel.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

class MainCalculatorViewModel {
    
    var selectedTip: Double = 0.1
    
    func tipChanged(with percentage: Double) {
        selectedTip = percentage
        
        print("Selected Tip: \(selectedTip * 100)%")
    }
}
