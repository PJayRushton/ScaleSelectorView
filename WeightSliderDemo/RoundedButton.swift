//
//  RoundedButton.swift
//  WeightSliderDemo
//
//  Created by Parker Rushton on 2/4/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = bounds.size.height / 2
        layer.masksToBounds = cornerRadius > 0
    }
    
}
