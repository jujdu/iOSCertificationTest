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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desriptionLabel: UILabel!
    
    //MARK: - Properties
    
    var answers: [Answer] = []
    private static var countOfRightAnswers: Int = 0
    private let defaults = UserDefaults.standard
    private var lastResult = 0
    private var bestResult = 0
    
    
    //MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "Futura", size: 17)!],
            for: UIControl.State.normal)
        
        lastResulLabel.text = "\(defaults.integer(forKey: "lastResult"))/\(answers.count)"
        bestResultLabel.text = "\(defaults.integer(forKey: "bestResult"))/\(answers.count)"
        
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
        
        let currentResult = ResultsViewController.countOfRightAnswers
        let currentResultInPrecent = Int((Double(currentResult) / Double(answers.count)) * 100)
        
        resultLabel.text = "\(currentResult)/\(answers.count)"
        
        defaults.set(currentResult, forKey: "lastResult")
        
        if currentResult > defaults.integer(forKey: "bestResult") {
            defaults.set(currentResult, forKey: "bestResult")
        }
        
        switch currentResultInPrecent {
        case 0 ... 24:
            titleLabel.text = "Sorry dude, it's awful"
            desriptionLabel.text = "Unfortunately, your score is \(currentResultInPrecent)%. Today you're unlucky or you just didn't prepare for this examination. It's your choice, but you must study more if you want to pass a real iOS Developer certification test in the future."
        case 25 ... 49:
            titleLabel.text = "Not your day..."
            desriptionLabel.text = "Okey, okey,  \(currentResultInPrecent)% is not \"F\" mark, you know. However, do you want to work as an iOS developer? Then it's not enough. I know, there are many easy questions, because I made this test for myself. So, just repeat basic knowledges and go ahead again."
        case 50 ... 74:
            titleLabel.text = "Not bad"
            desriptionLabel.text = "Your score is \(currentResultInPrecent)%. You know much basic knowledges, but anyway you didn't pass it. Why? Because it's only \"C\" mark, but you try it only for test your programming skills. So, repeat and do your best!"
        case 75 ... 89:
            titleLabel.text = "Good, but still not enough"
            desriptionLabel.text = "See? You can! \(currentResultInPrecent)% is almost perfect score... Yesss, only almost perfect... But it's not our way? Right? We must have the best skills and we have to repeat only few things. Then, go ahead and go it!"
        case 90 ... 100:
            titleLabel.text = "Perfect!"
            desriptionLabel.text = "DAMN, BOY! THIS IS \(currentResultInPrecent)%!. Maybe you do it after 100 tries or you're a genious that did it by the first try, haha. Anyway, in my opinion you're ready to try to pass a real iOS Developer certification test. Good luck and do your best!"
        default:
            break
        }
    }
}
