//
//  RoundButton.swift
//  ScintificCalculator
//
//  Created by Venkatram G V on 21/09/22.
//

import Foundation
import UIKit


@IBDesignable class MyButton: UIButton{
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        update()
        
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            update()
        }
    }

    fileprivate func update(){
        if UIApplication.shared.statusBarOrientation.isLandscape {
            layer.cornerRadius = rounded ? frame.size.height / 2 : 0
        } else {
            layer.cornerRadius = rounded ? frame.size.width / 2 : 0
        }
    }
    
}
