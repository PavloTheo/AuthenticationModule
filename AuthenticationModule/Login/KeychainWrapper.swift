//
//  KeychainWrapper.swift
//  WeavyMessenger
//
//  Created by Pavlo Theodoridis on 2023-06-01.
//

import Foundation
import KeychainAccess

struct KeychainKeys {
    static let accessToken = "ACCESS_TOKEN"
}


class KeychainWrapper {
    
    private let keychain = Keychain(service: "se.pavlotheo.AuthenticationModule")
    
    func storeAccessToken(token: String) {
        keychain[KeychainKeys.accessToken] = token
        print("Access token stored successfully")
    }
    
    func retrieveAccessToken() -> String? {
        if let token = keychain[KeychainKeys.accessToken] {
            print("Retrieved access token: \(token)")
            return token
        }
        print("Failed to retrieve access token.")
        return nil
    }

    func removeAccessToken() {
        keychain[KeychainKeys.accessToken] = nil
        print("Access token removed.")
    }

}
