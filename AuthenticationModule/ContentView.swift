//
//  ContentView.swift
//  AuthenticationModule
//
//  Created by Pavlo Theodoridis on 2023-05-23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @EnvironmentObject var authentication: Authentication
    @State var show = false
  
    var body: some View {
        
        Group {
            if authentication.isAuthenticated {
                HomeView()
                    .transition(.move(edge: .trailing))
            } else {
                LoginView(loginVM: loginVM)
                .alert(isPresented: $loginVM.showAlert) {
                    Alert(title: Text("Error"),
                          message: Text(loginVM.alertMessage),
                          dismissButton: .default(Text("OK"), action: {
                              loginVM.showAlert = false // reset the alert flag
                          }))
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(Animation.easeInOut(duration: 0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel())
            .environmentObject(Authentication.shared)
    }
}

