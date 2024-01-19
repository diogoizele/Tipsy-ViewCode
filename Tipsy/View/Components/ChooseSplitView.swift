//
//  ChooseSplitView.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//
import UIKit

class ChooseSplitView: UIView {
    
    private var mainCalculatorViewModel: MainCalculatorViewModel

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
        view.font = UIFont.systemFont(ofSize: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var quantitySelector: UIStepper = {
        let view = UIStepper()
        view.minimumValue = 2
        view.maximumValue = 15
        view.stepValue = 1
        view.value = Double(mainCalculatorViewModel.peopleQuantity)
        return view
    }()

    init(viewModel: MainCalculatorViewModel) {
        self.mainCalculatorViewModel = viewModel
        
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false

        peopleQuantityLabel.text = String(mainCalculatorViewModel.peopleQuantity)

        self.addSubview(chooseSplitLabel)
        NSLayoutConstraint.activate([
            chooseSplitLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
        ])

        self.addSubview(chooseSplitStackView)
        NSLayoutConstraint.activate([
            chooseSplitStackView.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 36),
            chooseSplitStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        chooseSplitStackView.addArrangedSubview(peopleQuantityLabel)
        chooseSplitStackView.addArrangedSubview(quantitySelector)

        quantitySelector.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)

        self.sizeToFit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func stepperValueChanged(_ sender: UIStepper) {
        let value = Int(sender.value)
        mainCalculatorViewModel.peopleQuantityChanged(with: value)
        peopleQuantityLabel.text = String(value)
    }
}
