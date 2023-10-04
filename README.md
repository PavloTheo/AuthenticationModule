# AuthenticationModule

An iOS app module designed in SwiftUI to provide user authentication functionality.
This module handles user login, token management using the Keychain package, and gives feedback on the authentication process.
It's designed for easy integration into larger iOS projects.

# Features

- User login with username and password.
- Keychain integration for secure token storage.
- Observable authentication state for reactive UI updates.
- Mock authentication process for demonstration.

# Setup

1. Clone the repository: git clone https://github.com/PavloTheo/AuthenticationModule.git
2. Open 'AuthenticationModule.xcodeproj' in Xcode.
3. Build and run the project on the desired simulator or device.

# Usage

This module can be integrated into larger projects that require user authentication.
Adjust the mock authentication to connect with your backend API or desired authentication service.

# Dependencies

This project makes use of the following third-party packages:

KeychainAccess: A simple Swift wrapper for Keychain that works on iOS, watchOS, tvOS, and macOS.
It provides an interface for securely storing data in the device's keychain. You can find more about it here:
https://github.com/kishikawakatsumi/KeychainAccess
