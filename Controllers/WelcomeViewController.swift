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
        let horizontalConstraint = bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let widthConstraint = bottomView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        let heightConstraint = bottomView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2)
        let bottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        NSLayoutConstraint.activate([horizontalConstraint,
                                     widthConstraint,
                                     heightConstraint,
                                     bottomConstraint])
    }
    
    private func setConstraintsToStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = stackView.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor)
        let verticalConstraint = stackView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint,
                                     verticalConstraint])
    }
    
    private func setConstraintToButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = button.heightAnchor.constraint(equalToConstant: 40)
        let widthConstraint = button.widthAnchor.constraint(greaterThanOrEqualToConstant: 250)
        NSLayoutConstraint.activate([heightConstraint,
                                     widthConstraint])
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) { }
}
