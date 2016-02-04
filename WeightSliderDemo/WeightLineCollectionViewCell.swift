//
//  WeightLineCollectionViewCell.swift
//  WeightSliderDemo
//
//  Created by Parker Rushton on 2/3/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

class WeightLineCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WeightLineCell"
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    let tallHeight: CGFloat = 40.0
    let shortHeight: CGFloat = 20.0
}
