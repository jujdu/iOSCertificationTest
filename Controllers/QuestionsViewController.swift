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
        Question(text: "What is the name of this interface element?",
                 answer: [Answer(text: "Assistent editor", type: true),
                          Answer(text: "Blablabla", type: false),
                          Answer(text: "Blablabla", type: false),
                          Answer(text: "Blablabla", type: false),],
                 image: "twst"),
        Question(text: "What's the name of this interface element?",
                 answer: [Answer(text: "Assistent editor2", type: true),
                          Answer(text: "Blablabla", type: false),
                          Answer(text: "Blablabla", type: false),
                          Answer(text: "Blablabla", type: false),],
                 image: "медведь2"),
        Question(text: "What's the name of this interface element?",
                 answer: [Answer(text: "Assistent editor2", type: true),
                          Answer(text: "Blablabla", type: false),
                          Answer(text: "Blablabla", type: false),
                          Answer(text: "Blablabla", type: false),],
                 image: ""),
        Question(text: "What output will be produced by the code above?",
                 answer: [Answer(text: "\"Square root of 25.0 is 5.0\"", type: true),
                          Answer(text: "\"Square root of 25 is 5\"", type: false),
                          Answer(text: "\"Square root of 5 is 25\"", type: false),
                          Answer(text: "The code won't be compilled", type: false),],
                 image: "1"),
        Question(text: "What output will be produced by the code above?",
                 answer: [Answer(text: "\"1000\"", type: true),
                          Answer(text: "\"1_000\"", type: false),
                          Answer(text: "\"_1000_\"", type: false),
                          Answer(text: "\"1000.0\"", type: false),],
                 image: "2"),
        Question(text: "How many bits are used to store an \"Int\"?",/////////////don't have any image
                 answer: [Answer(text: "It depends on a device", type: true),
                          Answer(text: "64", type: false),
                          Answer(text: "32", type: false),
                          Answer(text: "16", type: false),],
                 image: ""),
        Question(text: "When the code is executed, what is the value of someString?",
                 answer: [Answer(text: "\"Hello\"", type: true),
                          Answer(text: "\"0\"", type: false),
                          Answer(text: "The code won't be executed", type: false),
                          Answer(text: "\"0 Hello\"", type: false),],
                 image: "3"),
        Question(text: "What output will be produced by the code above?",
                 answer: [Answer(text: "The code won't be executed", type: true),
                          Answer(text: "\"Abc\", \"Dfe\"", type: false),
                          Answer(text: "\"ABC\", \"DFE\"", type: false),
                          Answer(text: "\"abc\", \"dfe\"", type: false),],
                 image: "4"),
        Question(text: "What data type does the \"number\" constant have?",
                 answer: [Answer(text: "Double", type: true),
                          Answer(text: "Float", type: false),
                          Answer(text: "CGFloat", type: false),
                          Answer(text: "The code won't be compilled", type: false),],
                 image: "5"),
        Question(text: "What output will be produced by the code above?",
                 answer: [Answer(text: "\"I use skate\"", type: true),
                          Answer(text: "\"I use bicycle\", \"I use skate\"", type: false),
                          Answer(text: "The code won't be compilled", type: false),
                          Answer(text: "Nothing", type: false),],
                 image: "       "),
        Question(text: "What output will be produced by the code above?",
                 answer: [Answer(text: "\"The number is 1\"", type: true),
                          Answer(text: "\"The number is 2\"", type: false),
                          Answer(text: "\"The number is 3\"", type: false),
                          Answer(text: "The code won't be compilled", type: false),],
                 image: "6"),
        Question(text: "What output will be produced by the code above?",
                 answer: [Answer(text: "The code won't be compilled", type: true),
                          Answer(text: "Nothing", type: false),
                          Answer(text: "\"Woof, Woof!\"", type: false),
                          Answer(text: "\"What does the husky say?\"", type: false),],
                 image: "9"),
        Question(text: "How many values will the array contain?",
                 answer: [Answer(text: "The code won't be compilled", type: true),
                          Answer(text: "0", type: false),
                          Answer(text: "3", type: false),
                          Answer(text: "1", type: false),],
                 image: "7"),
        Question(text: "What will the third constant contain?",
                 answer: [Answer(text: "\"a\", \"b\", \"c\", \"d\"", type: true),
                          Answer(text: "The code won't be compilled", type: false),
                          Answer(text: "\"a\", \"b\"", type: false),
                          Answer(text: "\"c\", \"d\"", type: false),],
                 image: "8"),
        Question(text: "What output will be produced the code above",
                 answer: [Answer(text: "\"128\"", type: true),
                          Answer(text: "\"64\"", type: false),
                          Answer(text: "\"127\"", type: false),
                          Answer(text: "\"2\"", type: false),],
                 image: "10"),
        Question(text: "What output will be produced the code above, if the function throw \"Declined\"?",
                 answer: [Answer(text: "\"Declined\"", type: true),
                          Answer(text: "\"error\"", type: false),
                          Answer(text: "The code won't be compilled", type: false),
                          Answer(text: "Nothing", type: false),],
                 image: "11"),
        Question(text: "What value will the constant have?",
                 answer: [Answer(text: "0", type: true),
                          Answer(text: "-2147483648", type: false),
                          Answer(text: "-65536", type: false),
                          Answer(text: "-256", type: false),],
                 image: "12"),
        Question(text: "What output will be produced the code above?",
                 answer: [Answer(text: "The code won't be compilled", type: true),
                          Answer(text: "\"Tesla\"", type: false),
                          Answer(text: "\"2\"", type: false),
                          Answer(text: "Nothing", type: false),],
                 image: "13"),
        Question(text: "What output will be produced the code above?",
                 answer: [Answer(text: "\"Moscow\", \"Minsk\"", type: true),
                          Answer(text: "\"Rome\", \"Minsk\"", type: false),
                          Answer(text: "\"Moscow\", \"Tampa\"", type: false),
                          Answer(text: "\"Rome\", \"Tampa\"", type: false),],
                 image: "14"),
        Question(text: "What output will be producted the code above?",
                 answer: [Answer(text: "\"iPhone Xs\"", type: true),
                          Answer(text: "\"Samsung 10\"", type: false),
                          Answer(text: "The code won't be compilled", type: false),
                          Answer(text: "Nothing", type: false),],
                 image: "15"),
        Question(text: "What will be the value of the \"number2\" constant?",
                 answer: [Answer(text: "22 as String", type: true),
                          Answer(text: "4 as Int", type: false),
                          Answer(text: "The code won't be compilled", type: false),
                          Answer(text: "4 as String", type: false),],
                 image: "16"),
        Question(text: "What output will be producted the code above?",
                 answer: [Answer(text: "\"New York\"", type: true),
                          Answer(text: "\"Lodon\"", type: false),
                          Answer(text: "The code won't be compilled", type: false),
                          Answer(text: "Nothing", type: false),],
                 image: "17"),
        Question(text: "What output will be producted the code above?",
                 answer: [Answer(text: "The code won't be compilled", type: true),
                          Answer(text: "\"5\"", type: false),
                          Answer(text: "\"5.0\"", type: false),
                          Answer(text: "Nothing", type: false),],
                 image: "18"),
        Question(text: "",
                 answer: [Answer(text: "", type: true),
                          Answer(text: "", type: false),
                          Answer(text: "", type: false),
                          Answer(text: "", type: false),],
                 image: ""),
        ]
    
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
        // self.navigationItem.rightBarButtonItem?.tintColor = .white
        
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

