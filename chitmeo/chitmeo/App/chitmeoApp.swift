import SwiftUI

@main
struct chitmeoApp: App {
    @StateObject var authModel =  AuthViewModel()
     
    var body: some Scene {
        WindowGroup{
            ChitmeoView()
                .environmentObject(authModel)
        }
    }
}
