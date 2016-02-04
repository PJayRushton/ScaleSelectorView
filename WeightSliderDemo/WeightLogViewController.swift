//
//  ViewController.swift
//  WeightSliderDemo
//
//  Created by Parker Rushton on 2/3/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    
    
    var weight: Int = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightLabel.text = "\(weight)"
    }

    @IBAction func saveWeightButtonPressed(sender: UIButton) {
        print("Weight logged: \(weight)")
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(10, collectionView.bounds.height)
    }
    
    
}

