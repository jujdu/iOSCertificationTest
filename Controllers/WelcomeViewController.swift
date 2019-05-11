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
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraintsToBottomView()
        setConstraintsToStackView()
        setConstraintToButton()
    }
    
    private func setConstraintsToBottomView() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: super.view.frame.size.width).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: super.view.bottomAnchor).isActive = true
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
