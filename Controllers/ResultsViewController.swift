//
//  ResultsViewController.swift
//  iOSCertificationTest
//
//  Created by Michael Sidoruk on 05/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - @IBOutlets
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var lastResulLabel: UILabel!
    @IBOutlet weak var bestResultLabel: UILabel!
    
    //MARK: - Properties
    
    var answers: [Answer] = []
    private static var countOfRightAnswers: Double = 0
    private let defaults = UserDefaults.standard
    private var lastResult = 0.0
    private var bestResult = 0.0
    
    
    //MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true

        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "Futura", size: 17)!],
            for: UIControl.State.normal)
      
        lastResulLabel.text = String(Int(defaults.double(forKey: "lastResult")))
        bestResultLabel.text = String(Int(defaults.double(forKey: "bestResult")))
        
        knowResult(answers: answers)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ResultsViewController.countOfRightAnswers = 0
    }
    
    //MARK: Methods
    
    private func knowResult(answers: [Answer]) {
        for answer in answers {
            if answer.type {
                ResultsViewController.countOfRightAnswers += 1
            }
        }
        
        let currentResult = (ResultsViewController.countOfRightAnswers / Double(answers.count)) * 100
        resultLabel.text = "ur result is \(Int(currentResult))%"
        
        defaults.set(currentResult, forKey: "lastResult")
        
        if currentResult > defaults.double(forKey: "bestResult") {
            defaults.set(currentResult, forKey: "bestResult")
        }
    }
}
