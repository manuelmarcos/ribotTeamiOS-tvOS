//
//  ViewController.swift
//  ribotTeamtvOS
//
//  Created by Manuel Marcos Regalado on 13/01/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SharedDataManager.sharedInstance.collectionOfRibots { dataResult in
            switch dataResult {
            case .Success(let ribots):
                print("team view ribots: \(ribots)")
            case .Failure:
                print("FAILURE")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

