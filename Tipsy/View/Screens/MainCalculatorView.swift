//
//  MainCalculatorViewController.swift
//  Tipsy
//
//  Created by Diogo Gabriel Izele on 12/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

final class MainCalculatorView: UIViewController {
    
    private var mainCalculatorViewModel = MainCalculatorViewModel()
    
    private var headerView: HeaderView
    private var bodyView: BodyView
    
    init() {
        self.headerView = HeaderView(viewModel: mainCalculatorViewModel)
        self.bodyView = BodyView(viewModel: mainCalculatorViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setConstraints()
    }
    
    private func setConstraints() {
        view.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        view.addSubview(bodyView)
        NSLayoutConstraint.activate([
            bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            bodyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bodyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bodyView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
            
    }
    
}
