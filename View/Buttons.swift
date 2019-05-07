//
//  Buttons.swift
//  iOSCertificationTest
//
//  Created by Michael Sidoruk on 05/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

@IBDesignable
class Buttons: UIButton {
    
    override func prepareForInterfaceBuilder() {
        customizeButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeButton()
    }
    
    func customizeButton() {
        backgroundColor = .red
        clipsToBounds = true
        layer.cornerRadius = 10                 //frame.size.height / 2
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont (name: "Futura-Bold", size: 17)
    }
    
    
    
}
