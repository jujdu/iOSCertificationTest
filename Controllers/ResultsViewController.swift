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
    
    //MARK: - Properties
    
    var answers: [Answer] = []
    private static var countOfRightAnswers: Double = 0
    
    //MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
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
        
        let result = (ResultsViewController.countOfRightAnswers / Double(answers.count)) * 100
        resultLabel.text = "ur result is \(Int(result))%"
    }
}
