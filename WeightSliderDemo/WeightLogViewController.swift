//
//  WeightLogViewController.swift
//  WeightSliderDemo
//
//  Created by Parker Rushton on 2/3/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

class WeightLogViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicatorLineView: UIView!
    
    private let weightDefaultsKey = "UserWeight"
    private let maxWeight = 463
    private let itemWidth: CGFloat = 14.0
    private let evenLineHeight: CGFloat = 30.0
    private let oddLineHeight: CGFloat = 15.0
    
    private var weight: Int = 150 {
        didSet {
            weightLabel.text = "\(weight)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitalWeight()
    }

    @IBAction func saveWeightButtonPressed(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setInteger(weight, forKey: weightDefaultsKey)
        print("Saved Weight! (\(weight))")
    }

}

extension WeightLogViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        configureWeight()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        snapToLine()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        snapToLine()
    }
    
}

private extension WeightLogViewController {
    
    private func setInitalWeight() {
        let savedWeight = NSUserDefaults.standardUserDefaults().integerForKey(weightDefaultsKey)
        if savedWeight != 0 {
            weight = savedWeight
        }
        let indexPath = NSIndexPath(forItem: weight, inSection: 0)
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
    }
    
    private func snapToLine() {
        guard let centerIndex = indexPathForCellAtCenter() else { return }
        collectionView.scrollToItemAtIndexPath(centerIndex, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
    }
    
    private func configureWeight() {
        guard let centerItemIndexPath = indexPathForCellAtCenter() else { return }
        weight = centerItemIndexPath.item
    }
    
    private func indexPathForCellAtCenter() -> NSIndexPath? {
        let centerPoint = view.convertPoint(indicatorLineView.center, toView: collectionView)
        return collectionView.indexPathForItemAtPoint(centerPoint)
    }
    
}

extension WeightLogViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(WeightLineCollectionViewCell.reuseIdentifier, forIndexPath: indexPath) as? WeightLineCollectionViewCell else { preconditionFailure() }
        cell.heightConstraint.constant = indexPath.item % 2 == 0 ? evenLineHeight : oddLineHeight
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return maxWeight
    }
}

extension WeightLogViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(itemWidth, collectionView.bounds.height)
    }
    
}
