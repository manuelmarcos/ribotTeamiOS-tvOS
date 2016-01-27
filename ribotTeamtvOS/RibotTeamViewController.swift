//
//  RibotTeamViewController.swift
//  ribotTeam
//
//  Created by Manuel Marcos Regalado on 26/01/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import UIKit

class RibotTeamViewController: SharedRibotTeamViewController  {
    func collectionView(collectionView: UICollectionView, didUpdateFocusInContext context: UICollectionViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        if let indexPath = context.previouslyFocusedIndexPath,
            cell = collectionView.cellForItemAtIndexPath(indexPath) as? SharedRibotTeamViewCell {
                coordinator.addCoordinatedAnimations({
                    cell.ribotNameLabel.alpha = 0.0
                    }, completion: nil)
        }
        
        if let indexPath = context.nextFocusedIndexPath,
            cell = collectionView.cellForItemAtIndexPath(indexPath) as? SharedRibotTeamViewCell {
                coordinator.addCoordinatedAnimations({
                    cell.ribotNameLabel.alpha = 1.0
                    }, completion: nil)
        }
    }
}
