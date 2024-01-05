import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSignInEnabled = false
    @State private var isLoading = false
    @State private var showAlert = false
    @EnvironmentObject var authModel: AuthViewModel
    let alertTitle: String = "Save failed."
    var body: some View {
        
        VStack {
            Spacer()
            
            AppIcon()
            VStack {
                InputView(text: $username, title: "Email Address", placeholder: "name@chitmeo.com")
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
            }
            .padding(.horizontal)
            
            if isLoading {
                ProgressView("Logging in...")
                    .foregroundColor(.blue)
            }
            Button{
                authenticate();
            } label: {
                HStack {
                    Text("SIGN IN")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width-32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .opacity(isSignInEnabled ? 1.0 : 0.5)
            .disabled(!isSignInEnabled)
            
            Spacer()
        }
        .padding()
        .onChange(of: username) { newValue in
            updateSignInButtonState()
        }
        .onChange(of: password) { newValue in
            updateSignInButtonState()
        }
        .alert(isPresented: $showAlert) {
                   Alert(
                       title: Text("Login Failed"),
                       message: Text("Please check your username and password and try again."),
                       dismissButton: .default(Text("OK"))
                   )
               }
    }
    private func updateSignInButtonState() {
        isSignInEnabled = !username.isEmpty && !password.isEmpty && !isLoading
    }
    
    func authenticate() {
        isLoading = true
        
        // Construct your API endpoint URL
        let apiURL = URL(string: "https://devbetter.net/api/user/login")!
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        
        // Create a JSON payload with the username and password
        let json: [String: Any] = [
            "email": username,
            "password": password
        ]
        
        // Convert the payload to Data
        let jsonData = try! JSONSerialization.data(withJSONObject: json)
        
        // Set the request body
        request.httpBody = jsonData
        
        // Set the request headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
            // Print the response text for debugging
            //if let responseText = String(data: data!, encoding: .utf8) {
            //          print("Response Text: \(responseText)")
            //      }
            
            guard let data = data, error == nil else {
                self.showAlert = true
                return
            }
            
            // Parse the response JSON
            if let responseJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                
                DispatchQueue.main.async {
                    let success = responseJson["isSuccessful"] as? Bool
                    if success!{
                        print("Is successful!!!")
                        self.authModel.isLoggedIn = true
                        self.authModel.fullName = responseJson["fullName"] as! String
                        self.authModel.accessToken = responseJson["accessToken"] as! String
                    }
                    else{
                        self.showAlert = true
                    }
                }
            }
        }.resume()
    }
}

#Preview {
    @StateObject var authModel =  AuthViewModel()
    return LoginView()
        .environmentObject(authModel)
}
