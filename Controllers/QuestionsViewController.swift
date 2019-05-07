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
    
    private var questions: [Question] = [
        Question(text: "1", answer: [
            Answer(text: "Assistent editor", type: true),
            Answer(text: "Blablabla", type: false),
            Answer(text: "Blablabla", type: false),
            Answer(text: "Blablabla", type: false),], image: ""),
        Question(text: "2", answer: [
            Answer(text: "Assistent editor2", type: true),
            Answer(text: "Blablabla", type: false),
            Answer(text: "Blablabla", type: false),
            Answer(text: "Blablabla", type: false),], image: ""),
        Question(text: "3", answer: [
            Answer(text: "Assistent editor2", type: true),
            Answer(text: "Blablabla", type: false),
            Answer(text: "Blablabla", type: false),
            Answer(text: "Blablabla", type: false),], image: ""),
        ]
    
    // for randomazing questions and answers
    private var shuffledQuestions: [Question] = []
    private var shuffledAnswers: [Answer] = []
    
    private static var answersChosen: [Answer] = []
    
    private var questionIndex = 0
    
    //MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 18)!]
        
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
        
        updateButtonsAndImage(using: shuffledAnswers)
    }
    
    private func updateButtonsAndImage(using answers: [Answer]) {
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
