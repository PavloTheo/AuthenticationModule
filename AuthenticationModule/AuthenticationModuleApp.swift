//
//  AuthenticationModule.swift
//  AuthenticationModule
//
//  Created by Pavlo Theodoridis on 2023-05-23.
//

import SwiftUI

@main

struct AuthenticationModuleApp: App {

    @StateObject private var loginVM = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginVM)
                .environmentObject(Authentication.shared)
        }
    }
}
