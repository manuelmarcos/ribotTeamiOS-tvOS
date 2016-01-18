//
//  RibotProfile.swift
//  ribotTeam
//
//  Created by Manuel Marcos Regalado on 15/01/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import Foundation

final class SharedRibotProfile: NSObject {
    
    // MARK: - Declaration of vars
    
    var name: SharedRibotName
    var email: String
    var hexColor: String
    var ribotar: NSURL
    var dateOfBirth: String
    var bio: String?
    
    // MARK: - Init the class
    
    init(name: SharedRibotName, email: String, hexColor: String, ribotar: NSURL, dateOfBirth: String, bio: String) {
        self.name        = name
        self.email       = email
        self.hexColor    = hexColor
        self.ribotar     = ribotar
        self.dateOfBirth = dateOfBirth
        self.bio         = bio
    }
    
    init(name: SharedRibotName, email: String, hexColor: String, ribotar: NSURL, dateOfBirth: String) {
        self.name        = name
        self.email       = email
        self.hexColor    = hexColor
        self.ribotar     = ribotar
        self.dateOfBirth = dateOfBirth
    }
    
    // MARK: - Description
    
    override var description: String {
        var description: String = self.name.description + "\n" + self.email + "\n" + self.hexColor + "\n" + self.ribotar.absoluteString + "\n" + self.dateOfBirth
        if bio != nil {
            description = description + "\n" + self.bio!
        }
        return description
    }
}

// Mark: - Alamofire ResponseObjectSerializable implementation

extension SharedRibotProfile: ResponseObjectSerializable, ResponseCollectionSerializable  {
    
    convenience init?(response: NSHTTPURLResponse, representation: AnyObject) {
        if let ribotProfileRepresentation = representation.valueForKeyPath(SharedConstants.RibotAPI.Keys.Ribot.ribotProfile),
            nameRepresentation = ribotProfileRepresentation.valueForKeyPath(SharedConstants.RibotAPI.Keys.RibotProfile.name),
            email = ribotProfileRepresentation.valueForKeyPath(SharedConstants.RibotAPI.Keys.RibotProfile.email) as? String,
            hexColor = ribotProfileRepresentation.valueForKeyPath(SharedConstants.RibotAPI.Keys.RibotProfile.hexColor) as? String,
            ribotar = ribotProfileRepresentation.valueForKeyPath(SharedConstants.RibotAPI.Keys.RibotProfile.ribotar) as? String,
            dateOfBirth = ribotProfileRepresentation.valueForKeyPath(SharedConstants.RibotAPI.Keys.RibotProfile.dateOfBirth) as? String {
                let name = SharedRibotName(response: response, representation: nameRepresentation)!
                self.init(name: name, email: email, hexColor: hexColor, ribotar: NSURL(string: ribotar)!, dateOfBirth: dateOfBirth)
                self.bio = ribotProfileRepresentation.valueForKeyPath(SharedConstants.RibotAPI.Keys.RibotProfile.bio) as? String
        } else {
            return nil
        }
    }
    
    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [SharedRibotProfile] {
        var ribotProfiles: [SharedRibotProfile] = [];
        if let representation = representation as? [[String: AnyObject]] {
            for userRepresentation in representation {
                if let ribotProfile = SharedRibotProfile(response: response, representation: userRepresentation) {
                    ribotProfiles.append(ribotProfile)
                }
            }
        }
        return ribotProfiles
    }
}


final class SharedRibotName: NSObject {
    
    // MARK: - Declaration of vars
    
    var first: String
    var last: String
    
    // MARK: - Init the class
    
    init(first: String, last: String) {
        self.first = first
        self.last  = last
    }
    
    // MARK: - Description
    
    override var description: String {
        return self.first + " " + self.last
    }
}

// Mark: - Alamofire ResponseObjectSerializable implementation

extension SharedRibotName: ResponseObjectSerializable {
    
    convenience init?(response: NSHTTPURLResponse, representation: AnyObject) {
        if let first = representation.valueForKeyPath(SharedConstants.RibotAPI.Keys.RibotName.first) as? String,
            last = representation.valueForKeyPath(SharedConstants.RibotAPI.Keys.RibotName.last) as? String {
                self.init(first: first, last: last)
        } else {
            return nil
        }
    }
}
