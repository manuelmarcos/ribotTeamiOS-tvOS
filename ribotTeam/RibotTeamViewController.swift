//
//  RibotTeamViewController.swift
//  ribotTeam
//
//  Created by Manuel Marcos Regalado on 22/01/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import UIKit

class RibotTeamViewController: SharedRibotTeamViewController  {
    var refreshControl: UIRefreshControl!

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        self.refreshControl.tintColor = UIColor.whiteColor()
        self.refreshControl.addTarget(self, action: "loadTeamRibots", forControlEvents: UIControlEvents.ValueChanged)
        self.teamCollectionView.addSubview(refreshControl)
    }
    
    override func loadTeamRibotsSuccess() {
        super.loadTeamRibotsSuccess()
        self.refreshControl.endRefreshing()
    }

    override func loadTeamRibotsFailure() {
        super.loadTeamRibotsFailure()
        self.refreshControl.endRefreshing()
    }
}
