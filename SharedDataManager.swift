//
//  SharedDataManager.swift
//  ribotTeam
//
//  Created by Manuel Marcos Regalado on 15/01/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import Foundation

public enum DataResult<Value> {
    case Success(Value)
    case Failure(NSError)
}

class SharedDataManager  {

    // MARK: - ribots methods

    // Load the list of ribots with checkins
    func collectionOfRibots(completionHandler: (DataResult<[SharedRibotProfile]> -> Void)) {
        
        SharedNetworkManager.sharedInstance.getCollectionOfRibots() { response in
            switch response.result {
            case .Success(let ribots):
                // Sort the collection of ribots by first name
                let sortedRibots = ribots.sort({ $0.name.first < $1.name.first})
                completionHandler(DataResult<[SharedRibotProfile]>.Success(sortedRibots))
            case .Failure(let error):
                completionHandler(DataResult.Failure(error))
            }
        }
    }

    // MARK: - Shared Instance
    
    static let sharedInstance = SharedDataManager()
}
