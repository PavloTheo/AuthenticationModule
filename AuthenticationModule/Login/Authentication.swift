//
//  Authentication.swift
//  WeavyMessenger
//
//  Created by Pavlo Theodoridis on 2023-05-29.
//

import Foundation
import SwiftUI

/// `Authentication` handles the user's authentication state and manages authentication tasks.
///
/// This class encapsulates the methods and properties related to user authentication,
/// such as logging in and logging out.
class Authentication: ObservableObject {
    
    /// Represents the current authentication status.
    @AppStorage("AUTH_KEY") var isAuthenticated = false {
        willSet { objectWillChange.send() }
    }
    
    static let shared = Authentication()
    
    private let keychainWrapper = KeychainWrapper()
    
    /// Authenticates a user using the provided `username` and `password`.
    ///
    /// - Parameters:
    ///   - username: User's username.
    ///   - password: User's password.
    ///   - completion: A closure that gets called once the authentication request completes.
    func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void) {
        
        // Here, we're going to mock the authentication.
        // You might want to use a hardcoded username and password for the mock.
        if username == "MockUsername" && password == "mockPassword" {
            let mockToken = "mock_token_12345"
            keychainWrapper.storeAccessToken(token: mockToken) // Store the token
            isAuthenticated = true
            completion(true) // login successful
        } else {
            isAuthenticated = false
            completion(false) // login failed
        }
    }
    
    /// Logs out the currently authenticated user.
    func logOut() {
        keychainWrapper.removeAccessToken()
        isAuthenticated = false
    }
}

struct TokenResponse: Decodable {
    let accessToken: String
    let expiresIn: Int
}
