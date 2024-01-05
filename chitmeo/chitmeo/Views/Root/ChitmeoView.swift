import SwiftUI
struct ChitmeoView: View {
    @EnvironmentObject var authModel : AuthViewModel
    var body: some View {
        Group{
            if authModel.isLoggedIn {
                NavigatorView()
            }
            else
            {
                LoginView()
            }
        }
    }
}

#Preview {
    @StateObject var authModel =  AuthViewModel()
    return ChitmeoView()
        .environmentObject(authModel)
}
