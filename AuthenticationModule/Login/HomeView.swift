//
//  HomeView.swift
//  AuthenticationModule
//
//  Created by Pavlo Theodoridis on 2023-10-03.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.largeTitle)
            Text("You have successfully logged in.")
                .font(.title2)
            
            Button(action: {
                authentication.logOut()
            }) {
                Text("Logout")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
