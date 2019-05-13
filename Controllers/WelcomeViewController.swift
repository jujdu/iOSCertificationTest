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
        Do you want to be an iOS Developer?
        Probably, you're struggle a lot, but you
        don't feel that your knowledges become
        better and better? Try this exam to check
        your SKILLS.
        
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
//      let trailingConstraint =
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
