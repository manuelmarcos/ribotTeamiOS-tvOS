//
//  SharedRibotTeamViewController.swift
//  ribotTeam
//
//  Created by Manuel Marcos Regalado on 18/01/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class SharedRibotTeamViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var teamCollectionView: UICollectionView!
    @IBOutlet var teamActivityIndicator: UIActivityIndicatorView!
    var teamRibots: [SharedRibotProfile] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadTeamRibots()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamRibots.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RibotTeamViewCell", forIndexPath: indexPath) as! SharedRibotTeamViewCell
        cell.ribotNameLabel.text = teamRibots[indexPath.row].name.first
        cell.ribotarImageView.af_setImageWithURL(teamRibots[indexPath.row].ribotar, placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
    
    func loadTeamRibots() {
        teamActivityIndicator.startAnimating()
        SharedDataManager.sharedInstance.collectionOfRibots { dataResult in
            switch dataResult {
            case .Success(let ribots):
                self.teamRibots = ribots
                self.loadTeamRibotsSuccess()
            case .Failure:
                self.loadTeamRibotsFailure()
            }
        }
    }
    
    func loadTeamRibotsSuccess() {
        teamActivityIndicator.stopAnimating()
        self.teamCollectionView.reloadData()
    }
    
    func loadTeamRibotsFailure() {
        teamActivityIndicator.stopAnimating()
        let alert = UIAlertController(title: title, message: "There was an error trying to load ribot team", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: UIAlertActionStyle.Default, handler:nil))
        presentViewController(alert, animated: true, completion: nil)
    }
}
