//
//  NetworkManager.swift
//  ribotTeam
//
//  Created by Manuel Marcos Regalado on 15/01/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import Alamofire

class SharedNetworkManager {
    
    // MARK: - ribots methods
    
    func getCollectionOfRibots(completionHandler: (Response<[SharedRibotProfile], NSError> -> Void)) {
        Alamofire.request(.GET, urlWithEndpoint(SharedConstants.RibotAPI.EndPoints.collectionOfRibots), parameters: nil, encoding: ParameterEncoding.URL)
            .validate()
            .responseCollection(completionHandler)
    }
    
    // MARK: - Helpers
    
    private func urlWithEndpoint(endpoint: String) -> String {
        return "\(SharedConstants.RibotAPI.EndPoints.baseURL)\(endpoint)"
    }

    // MARK: - Shared Instance
    
    static let sharedInstance = SharedNetworkManager()
}
