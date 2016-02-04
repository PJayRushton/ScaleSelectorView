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
    
    private let maxWeight = 400
    
    private var weight: Int = 150 {
        didSet {
            weightLabel.text = "\(weight)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let indexPath = NSIndexPath(forItem: 150, inSection: 0)
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
        configureWeight()
    }

    @IBAction func saveWeightButtonPressed(sender: UIButton) {
        print("Weight logged: \(weight)")
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
    
    private func snapToLine() {
        guard let centerIndex = indexPathForCellAtCenter() else { return }
        collectionView.scrollToItemAtIndexPath(centerIndex, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
    }
    
    private func configureWeight() {
        guard let centerIndex = indexPathForCellAtCenter() else { return }
        weight = centerIndex.item
    }
    
    private func indexPathForCellAtCenter() -> NSIndexPath? {
        let centerPoint = view.convertPoint(view.center, toView: collectionView)
        return collectionView.indexPathForItemAtPoint(centerPoint)
    }
    
}

extension WeightLogViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(WeightLineCollectionViewCell.reuseIdentifier, forIndexPath: indexPath) as? WeightLineCollectionViewCell else { preconditionFailure() }
        cell.heightConstraint.constant = indexPath.item % 2 == 0 ? 30.0 : 15.0
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return maxWeight
    }
}

extension WeightLogViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(14, collectionView.bounds.height)
    }
    
}
