//
//  WelcomeViewController.swift
//  iOSCertificationTest
//
//  Created by Michael Sidoruk on 05/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = """
        Whazzup?? I made this application when
        I knew about an iOS Developer exam.
        Actually, it's a certification, but anyway...
        I've got some inside info about questions
        "types" and added this in my application.
        So, try this exam to check your SKILLS.
        
        Good luck!
        """
        label.textAlignment = .center
        
        setConstraintsToTopView()
        setConstraintsToImageView()
        setConstraintsToBottomView()
        setConstraintsToStackView()
        setConstraintToButton()
    }
    
    private func setConstraintsToTopView() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        topView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    private func setConstraintsToImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 40.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 165).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 10.0/7.0).isActive = true
    }
    
    private func setConstraintsToBottomView() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setConstraintsToStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 16.0).isActive = true
        stackView.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -16.0).isActive = true
//        NSLayoutConstraint.activate([horizontalConstraint,
//                                     verticalConstraint,
//                                     leadingConstraint,
//                                     trailingConstraint])
    }
    
    private func setConstraintToButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) { }
}
