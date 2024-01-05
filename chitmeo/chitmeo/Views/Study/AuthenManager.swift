import Foundation
class AuthenManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var username = ""
    // Add other user-related properties here
}
class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isAuthenticated = false

    func login(authenManager: AuthenManager) {
        // Perform your authentication logic here
        // For simplicity, let's consider a basic check for demonstration
        if username == "Demo" && password == "Demo" {
            isAuthenticated = true
            authenManager.isLoggedIn = true
            authenManager.username = username
            // Add other user-related property assignments here
        } else {
            isAuthenticated = false
        }
    }
}
