//
//  ResultView.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 20/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

final class ResultView: UIViewController {
    
    var calculatedResult = 0.0
    var peopleSplitted = 2
    var tipPercentage = 0.0
    
    private lazy var headerResultView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "BackgroundColor")
        return view
    }()
    
    private lazy var totalPerPersonLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Total per person"
        view.textColor = UIColor(named: "TextColor")
        view.font = UIFont.systemFont(ofSize: 24)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var totalPerPersonValue: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "56.32"
        view.textColor = UIColor(named: "PrimaryColor")
        view.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var splitBetweenPhraseLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Split between 2 people, with 10% tip."
        view.textColor = UIColor(named: "TextColor")
        view.font = UIFont.systemFont(ofSize: 20)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var recalculateButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(named: "PrimaryColor")
        view.setTitle("Recalculate", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 24.0, bottom: 0, right: 24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        
        totalPerPersonValue.text = String(format: "%.2f", calculatedResult)
        splitBetweenPhraseLabel.text = "Split between \(peopleSplitted) people, with \(tipPercentage * 100)% tip."
    }
    
    func setupConstraints() {
        
        view.backgroundColor = .white
        
        view.addSubview(headerResultView)
        NSLayoutConstraint.activate([
            headerResultView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headerResultView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerResultView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerResultView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        headerResultView.addSubview(totalPerPersonLabel)
        NSLayoutConstraint.activate([
            totalPerPersonLabel.topAnchor.constraint(equalTo: headerResultView.topAnchor, constant: 150),
            totalPerPersonLabel.leadingAnchor.constraint(equalTo: headerResultView.leadingAnchor, constant: 0),
            totalPerPersonLabel.trailingAnchor.constraint(equalTo: headerResultView.trailingAnchor, constant: 0)
        ])
        
        headerResultView.addSubview(totalPerPersonValue)
        NSLayoutConstraint.activate([
            totalPerPersonValue.topAnchor.constraint(equalTo: totalPerPersonLabel.topAnchor, constant: 48),
            totalPerPersonValue.leadingAnchor.constraint(equalTo: headerResultView.leadingAnchor, constant: 0),
            totalPerPersonValue.trailingAnchor.constraint(equalTo: headerResultView.trailingAnchor, constant: 0)
        ])
        
        view.addSubview(splitBetweenPhraseLabel)
        NSLayoutConstraint.activate([
            splitBetweenPhraseLabel.topAnchor.constraint(equalTo: headerResultView.bottomAnchor, constant: 54),
            splitBetweenPhraseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            splitBetweenPhraseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48)
        ])
        
        
        view.addSubview(recalculateButton)
        NSLayoutConstraint.activate([
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        recalculateButton.isUserInteractionEnabled = true
        recalculateButton.addTarget(self, action: #selector(backToMainScreen(_:)), for: .touchUpInside)
    }
    
    @objc
    func backToMainScreen(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
