//
//  QuestionsViewController.swift
//  iOSCertificationTest
//
//  Created by Michael Sidoruk on 05/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    //MARK: - @IBOutlets

    @IBOutlet var buttonsCollection: [Buttons]!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: - Properties
    
    let questions = Helpers.questions
    
    // for randomazing questions and answers
    private var shuffledQuestions: [Question] = []
    private var shuffledAnswers: [Answer] = []
    
    private static var answersChosen: [Answer] = []
    
    private var questionIndex = 0
    
    //MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "Futura", size: 17)!],
            for: UIControl.State.normal)
        
        // to clear answersChosen array each new test
        QuestionsViewController.answersChosen = []
        
        shuffledQuestions = questions.shuffled()
        
        updateUI()
    }
    
    //MARK: Methods
    
    private func updateUI() {
        
        navigationItem.title = "Question № \(questionIndex + 1)"
        
        let question = shuffledQuestions[questionIndex]
        
        questionLabel.text = question.text
        
        shuffledAnswers = question.answer.shuffled()
        
        let progress = Float(questionIndex) / Float(shuffledQuestions.count)
        progressView.progress = progress
        
        updateAnswers(using: shuffledAnswers)
    }
    
    private func updateAnswers(using answers: [Answer]) {

        for index in 0..<min(buttonsCollection.count, answers.count) {
            buttonsCollection[index].setTitle(answers[index].text, for: .normal)
        }
        imageView.image = UIImage(named: shuffledQuestions[questionIndex].image)
    }
    
    private func setNextQuestion() {
        questionIndex += 1
        if questionIndex < shuffledQuestions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    // MARK: - Navigation

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Attention!", message: "Your current exam progress will reset.\nDo you really want to cancel?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindSegue", sender: self)
        })
        let declineAction = UIAlertAction(title: "No", style: .default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(declineAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let vc = segue.destination as! ResultsViewController
            vc.answers = QuestionsViewController.answersChosen
        }
    }

    // MARK: - @IBActions
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let index = buttonsCollection.firstIndex(of: sender as! Buttons)!
        QuestionsViewController.answersChosen.append(shuffledAnswers[index])
        setNextQuestion()
    }
}

