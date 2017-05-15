//
//  CalculatorButton.swift
//  Currency
//
//  Created by Nuno Coelho Santos on 25/02/2016.
//  Copyright © 2016 Nuno Coelho Santos. All rights reserved.
//

import Foundation
import UIKit

class CalculatorButton: UIButton {
    
    let borderColor: CGColor! = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.00).cgColor
    let normalStateColor: CGColor! = UIColor(red:0, green:0, blue:0, alpha:0).cgColor
    let highlightStateColor: CGColor! = UIColor(red:0, green:0, blue:0, alpha:0.08).cgColor
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

        self.layer.borderWidth = 0.5
        self.layer.borderColor = borderColor
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(cgColor: normalStateColor)
    }
    
    override var isHighlighted: Bool {
        
        get {
            return super.isHighlighted
        }
        set {
            if newValue {
                let fadeIn = CABasicAnimation(keyPath: "backgroundColor")
                fadeIn.fromValue = normalStateColor
                fadeIn.toValue = highlightStateColor
                fadeIn.duration = 0.12
                fadeIn.autoreverses = false
                fadeIn.repeatCount = 1
                
                self.layer.add(fadeIn, forKey: "fadeIn")
                self.backgroundColor = UIColor(cgColor: highlightStateColor)
            }
            else {
                let fadeOut = CABasicAnimation(keyPath: "backgroundColor")
                fadeOut.fromValue = highlightStateColor
                fadeOut.toValue = normalStateColor
                fadeOut.duration = 0.12
                fadeOut.autoreverses = false
                fadeOut.repeatCount = 1
                
                self.layer.add(fadeOut, forKey: "fadeOut")
                self.backgroundColor = UIColor(cgColor: normalStateColor)
            }
            super.isHighlighted = newValue
        }
    }
    
}
