//
//  LoginView.swift
//  WeavyMessenger
//
//  Created by Pavlo Theodoridis on 2023-05-23.
//

import SwiftUI

/// LoginView provides the UI for users to log in to the application.
///
/// It displays fields for the user to input their username and password, and provides feedback on successful or failed login attempts.

struct LoginView: View {
    
    @StateObject var loginVM: LoginViewModel // ViewModel that handles login logic and provides bindable properties.
    
    @State private var isLoading = false // Indicates if there's an ongoing login request, useful to show a loading UI.
    @State private var showError = false // Local state to determine if a UI error should be displayed.
    
    var body: some View {
            
            VStack {
            
                
                // Display a loading animation when the application is trying to log the user in.
                    if isLoading {
                        ProgressView()
                            .scaleEffect(2)
                            .padding()
                    }
                    
                // The main form for user input.
                    Form {
                        
                        // Section for entering the username and password.
                        Section(header: Text("Login")) {
                            
                            TextField("username", text: $loginVM.username)
                            SecureField("password", text: $loginVM.password)
                            
                        }
                        
                        // Section that displays errors when they occur.
                        if loginVM.errorMessage != "" {
                            Section {
                                Text(loginVM.errorMessage)
                                    .foregroundColor(.red)
                            }
                        }
                        
                        // Login button that triggers the login attempt when pressed.
                            Button(action: {
                                loginVM.login() { success in
                                    if success {
                                        
                                    } else {
                                        
                                    }
                                }
                            }) {
                                Text("Login")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(8)
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("", displayMode: .inline)
        
        }
    }

/// A preview provider for the LoginView, to visualize it in SwiftUI's design tools.
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginVM: LoginViewModel())
    }
}
