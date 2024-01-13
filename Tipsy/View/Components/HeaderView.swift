//
//  HeaderView.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    private lazy var headerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 24.0
        view.alignment = .leading
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var billTotalLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(named: "TextColor")
        view.text = "Enter bill total"
        view.font = UIFont.systemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var billTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "e.g 123.56"
        view.font = UIFont.systemFont(ofSize: 30.0)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(headerStackView)
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            headerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
        
        headerStackView.addSubview(billTotalLabel)
        NSLayoutConstraint.activate([
            billTotalLabel.topAnchor.constraint(equalTo: headerStackView.topAnchor, constant: 48),
            billTotalLabel.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 48),
            billTotalLabel.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor, constant: -48)
        ])
        
        headerStackView.addSubview(billTextField)
        NSLayoutConstraint.activate([
            billTextField.topAnchor.constraint(equalTo: billTotalLabel.topAnchor, constant: 28),
            billTextField.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 48),
            billTextField.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor, constant: -48)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}