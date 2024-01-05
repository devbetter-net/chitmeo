import SwiftUI

struct LoginScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = LoginViewModel()
    @EnvironmentObject var authenManager: AuthenManager
    
    var body: some View {
        VStack {
            Text("Login Screen")
                .font(.title)
                .padding()
            
            TextField("Username", text: $viewModel.username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Login") {
                viewModel.login(authenManager: authenManager)
                if viewModel.isAuthenticated {
                    authenManager.username = viewModel.username
                    // Close the sheet if login is successful
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
    }
    
}

#Preview {
    LoginScreenView()
}
