//
//  LoginViewModel.swift
//  WeavyMessenger
//
//  Created by Pavlo Theodoridis on 2023-06-01.
//

import Foundation
import SwiftUI

/// `LoginViewModel` handles the logic for authenticating a user.
///
/// This ViewModel encapsulates all the properties and methods required to authenticate a user
/// using their `username` and `password` and provide feedback on the authentication process.

class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    
    /// Represents error message from authentication failures.
    @Published var errorMessage = ""
    
    /// Flag to show/hide alert based on authentication outcome.
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    private var authentication = Authentication()
    
    
    /// Initializes the ViewModel.
    ///
    /// - Parameters:
    ///   - authentication: An `Authentication` instance to handle authentication tasks. Defaults to shared instance.
    init(authentication: Authentication = Authentication.shared) {
        self.authentication = authentication
    }

    /// Authenticates the user with provided credentials.
    ///
    /// - Parameters:
    ///   - completion: A closure that gets called once the authentication process completes. Returns `true` if authentication is successful, otherwise `false`.
    func login(completion: @escaping (Bool) -> Void) {
        
        authentication.authenticate(username: username, password: password) { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    self?.authentication.isAuthenticated = true
                    print("Login successful")
                    completion(true) // login successful
                } else {
                    self?.authentication.isAuthenticated = false
                    self?.errorMessage = "Authentication failed. Please check your credentials and try again."
                    completion(false) // login failed
                }
            }
        }
    }
}
