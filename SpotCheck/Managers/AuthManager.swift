import Foundation
import Combine
import FirebaseAuth // Make sure this is here
import FirebaseFirestore // If you need it
class AuthManager: ObservableObject {
  @Published var isSignedIn = false
  @Published var userEmail = ""

    init() {
       print("AuthManager initializing...")

        // Check if Firebase is available
        #if canImport(FirebaseAuth)
        print("FirebaseAuth is available")

        // Check current user
        if let user = Auth.auth().currentUser {
            self.isSignedIn = true
            self.userEmail = user.email ?? ""
            print("User already signed in: \(user.email ?? "no email")")
        } else {
            print("No user signed in")
        }
        #else
        print("FirebaseAuth NOT available - running in simulation mode")
        #endif
    }

    // Rest of your functions...
}
