//
//  SelectTipView.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class SelectTipView: UIView {
    
    private var mainCalculatorViewModel: MainCalculatorViewModel
    
    private lazy var selectTipLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(named: "TextColor")
        view.text = "Select tip"
        view.font = UIFont.systemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var selectTipValuesStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 24
        view.alignment = .center
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var zeroPctButton: ButtonPercentage = {
        let view = ButtonPercentage()
        view.setTitle("0%", for: .normal)
        view.setPercentage(0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tenPctButton: ButtonPercentage = {
        let view = ButtonPercentage()
        view.setTitle("10%", for: .normal)
        view.setPercentage(10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSelected = true
        return view
    }()
    
    private lazy var twentyPctButton: ButtonPercentage = {
        let view = ButtonPercentage()
        view.setTitle("20%", for: .normal)
        view.setPercentage(20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel: MainCalculatorViewModel) {
        self.mainCalculatorViewModel = viewModel
        
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        
        self.sizeToFit()
        
        self.addSubview(selectTipLabel)
        NSLayoutConstraint.activate([
            selectTipLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            selectTipLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            selectTipLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
        ])
        
        self.addSubview(selectTipValuesStackView)
        NSLayoutConstraint.activate([
            selectTipValuesStackView.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 12),
            selectTipValuesStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            selectTipValuesStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
        
        selectTipValuesStackView.addArrangedSubview(zeroPctButton)
        
        NSLayoutConstraint.activate([
            zeroPctButton.topAnchor.constraint(equalTo: selectTipValuesStackView.topAnchor, constant: 0),
            zeroPctButton.leadingAnchor.constraint(equalTo: selectTipValuesStackView.leadingAnchor, constant: 0)
        ])
        
        selectTipValuesStackView.addArrangedSubview(tenPctButton)
        NSLayoutConstraint.activate([
            tenPctButton.topAnchor.constraint(equalTo: selectTipValuesStackView.topAnchor, constant: 0)
        ])
        
        selectTipValuesStackView.addArrangedSubview(twentyPctButton)
        NSLayoutConstraint.activate([
            twentyPctButton.topAnchor.constraint(equalTo: selectTipValuesStackView.topAnchor, constant: 0),
            twentyPctButton.trailingAnchor.constraint(equalTo: selectTipValuesStackView.trailingAnchor, constant: 0)
        ])
        
        zeroPctButton.isUserInteractionEnabled = true
        zeroPctButton.addTarget(self, action: #selector(tipChanged(_:)), for: .touchUpInside)
        tenPctButton.isUserInteractionEnabled = true
        tenPctButton.addTarget(self, action: #selector(tipChanged(_:)), for: .touchUpInside)
        twentyPctButton.isUserInteractionEnabled = true
        twentyPctButton.addTarget(self, action: #selector(tipChanged(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    @objc private func tipChanged(_ sender: ButtonPercentage) {
        print("Clicou! \(sender.getPercentage())")
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        mainCalculatorViewModel.tipChanged(with: sender.getPercentage())
    }

}
