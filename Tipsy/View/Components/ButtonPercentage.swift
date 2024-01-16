//
//  ButtonPercentage.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 15/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ButtonPercentage: UIButton {
    
    override var isSelected: Bool {
        didSet {
            updateStyle()
        }
    }
    
    private var percentage: Double
    
    override init(frame: CGRect) {
        self.percentage = 0.0
        
        super.init(frame: frame)
        
        setupStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyles() {
        
        self.layer.cornerRadius = 8
        self.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        
        updateStyle()
    
    }
    
    private func updateStyle() {
        
        if isSelected {
            self.backgroundColor = UIColor(named: "PrimaryColor")
            self.setTitleColor(.white, for: .normal)
        } else {
            self.backgroundColor = .clear
            self.setTitleColor(UIColor(named: "PrimaryColor"), for: .normal)
        }
    }
    
    public func setPercentage(_ percentage: Double) {
        self.percentage = percentage / 100
    }
    
    public func getPercentage() -> Double {
        self.percentage
    }
}
