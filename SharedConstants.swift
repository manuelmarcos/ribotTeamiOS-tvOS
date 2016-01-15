//
//  SharedConstants.swift
//  ribotTeam
//
//  Created by Manuel Marcos Regalado on 15/01/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import Foundation

struct SharedConstants {
    struct RibotAPI {
        struct EndPoints {
            static let baseURL = "https://api.ribot.io"
            static let collectionOfRibots = "/ribots"
        }
        struct Keys {
            static let ribotKey = "ribot"
            
            struct Ribot {
                static let ribotProfile = "profile"
                static let checkIns = "checkIns"
            }
            
            struct RibotProfile {
                static let name = "name"
                static let email = "email"
                static let hexColor = "hexColor"
                static let ribotar = "avatar"
                static let dateOfBirth = "dateOfBirth"
                static let bio = "bio"
            }
            
            struct RibotName {
                static let first = "first"
                static let last = "last"
            }
        }
    }
}