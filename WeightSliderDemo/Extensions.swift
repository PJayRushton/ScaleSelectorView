//
//  Extensions.swift
//  WeightSliderDemo
//
//  Created by Parker Rushton on 2/3/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
}
