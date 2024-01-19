//
//  BodyView.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 13/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//
import UIKit

class BodyView: UIView {
    
    private var mainCalculatorViewModel: MainCalculatorViewModel
    
    private var selectTipView: SelectTipView
    private var chooseSplitView: ChooseSplitView

    private lazy var calculatedButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(named: "PrimaryColor")
        view.setTitle("Calculate", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 24.0, bottom: 0, right: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init(viewModel: MainCalculatorViewModel) {
        self.mainCalculatorViewModel = viewModel
        
        self.selectTipView = SelectTipView(viewModel: viewModel)
        self.chooseSplitView = ChooseSplitView(viewModel: viewModel)
        
        super.init(frame: .zero)
        
        self.backgroundColor = UIColor(named: "BackgroundColor")
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        
        self.addSubview(selectTipView)
        NSLayoutConstraint.activate([
            selectTipView.topAnchor.constraint(equalTo: self.topAnchor, constant: 36),
            selectTipView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            selectTipView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            selectTipView.heightAnchor.constraint(equalToConstant: 80)
        ])

        self.addSubview(chooseSplitView)
        NSLayoutConstraint.activate([
            chooseSplitView.topAnchor.constraint(equalTo: selectTipView.bottomAnchor, constant: 58),
            chooseSplitView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            chooseSplitView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            chooseSplitView.heightAnchor.constraint(equalToConstant: 100)
        ])

        
        self.addSubview(calculatedButton)
        NSLayoutConstraint.activate([
            calculatedButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            calculatedButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            calculatedButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        calculatedButton.isUserInteractionEnabled = true
        calculatedButton.addTarget(self, action: #selector(calculatePressed(_:)), for: .touchUpInside)
        
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func calculatePressed(_ sender: UIButton) {
        mainCalculatorViewModel.calculateValue()
    }
}
