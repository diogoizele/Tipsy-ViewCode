//
//  ChooseSplitView.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ChooseSplitView: UIView {
    
    private lazy var chooseSplitLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(named: "TextColor")
        view.text = "Choose split"
        view.font = UIFont.systemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var chooseSplitStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20
        view.alignment = .center
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var peopleQuantityLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(named: "PrimaryColor")
        view.text = "2"
        view.font = UIFont.systemFont(ofSize: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var quantitySelector: UIStepper = {
        let view = UIStepper()
        view.minimumValue = 2
        view.maximumValue = 15
        view.stepValue = 1
        view.value = 2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(chooseSplitLabel)
        NSLayoutConstraint.activate([
            chooseSplitLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
        ])
        
        self.addSubview(chooseSplitStackView)
        chooseSplitStackView.sizeToFit()
        NSLayoutConstraint.activate([
            chooseSplitStackView.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 36),
            chooseSplitStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        chooseSplitStackView.addArrangedSubview(peopleQuantityLabel)
        NSLayoutConstraint.activate([
            peopleQuantityLabel.topAnchor.constraint(equalTo: chooseSplitStackView.topAnchor, constant: 0)
        ])
        
        chooseSplitStackView.addArrangedSubview(quantitySelector)
        NSLayoutConstraint.activate([
            quantitySelector.topAnchor.constraint(equalTo: chooseSplitStackView.topAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
