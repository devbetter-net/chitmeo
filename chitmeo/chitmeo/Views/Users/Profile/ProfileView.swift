import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authModel: AuthViewModel
    var body: some View {
        VStack {
            Text("Full name: \(authModel.fullName)")
            Text("Access Key: \(authModel.accessToken)")
        }
        .padding()
    }
}

#Preview {
    @StateObject var authModel =  AuthViewModel()
    return ProfileView()
        .environmentObject(authModel)
}
