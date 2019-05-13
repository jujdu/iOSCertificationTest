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
    
    private var gradientLayer: CAGradientLayer!
    private var buttonCollorsNormal: [CGColor] = [#colorLiteral(red: 0.0579912588, green: 0.8644467592, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.01176470588, green: 0.7058823529, blue: 0.9960784314, alpha: 1).cgColor, #colorLiteral(red: 0.01960784314, green: 0.4470588235, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.631372549, green: 0.3529411765, blue: 0.9960784314, alpha: 1).cgColor]
    private var buttonCollorsHighlighted: [CGColor] = [#colorLiteral(red: 0.0579912588, green: 0.8644467592, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.01238023303, green: 0.7054875493, blue: 0.9975780845, alpha: 1).cgColor, #colorLiteral(red: 0.01866853796, green: 0.4470739961, blue: 0.9993873239, alpha: 1).cgColor, #colorLiteral(red: 0.6315301657, green: 0.3545400798, blue: 0.9946195483, alpha: 1).cgColor, #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor]
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = layer.bounds
    }
    
    override func prepareForInterfaceBuilder() {
        customizeButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeButton()
    }
    
    private func customizeButton() {
        clipsToBounds = true
        layer.cornerRadius = 5                //frame.size.height / 2
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont (name: "Futura-Bold", size: 17)
        
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = buttonCollorsNormal
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
        
        //animations for button states
        addTarget(self, action: #selector(buttonIsHighLighted), for: [.touchDown])
        addTarget(self, action: #selector(buttonIsNormal), for: [.touchUpInside, .touchUpOutside])
    }
    
    @objc private func buttonIsHighLighted() {
        gradientLayer.colors = buttonCollorsHighlighted
    }
    
    @objc private func buttonIsNormal() {
        gradientLayer.colors = buttonCollorsNormal
    }
    
}
