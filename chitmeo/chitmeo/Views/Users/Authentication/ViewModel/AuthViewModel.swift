
import Foundation

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn : Bool
    @Published var fullName: String
    @Published var accessToken : String
    
    init() {
        self.isLoggedIn = false
        self.fullName = ""
        self.accessToken = ""
    }
    
    // func signIn(withEmail: String, password: String) async throws {
    //     let apiURL = URL(string: "https://devbetter.net/api/user/login")!
    //     // Create a URLRequest with the required HTTP method
    //     var request = URLRequest(url: apiURL)
    //     request.httpMethod = "POST"
        
    //     // Create a JSON payload with the username and password
    //     let json: [String: Any] = [
    //         "email": withEmail,
    //         "password": password
    //     ]
        
    //     // Convert the payload to Data
    //     let jsonData = try! JSONSerialization.data(withJSONObject: json)
        
    //     // Set the request body
    //     request.httpBody = jsonData
        
    //     // Set the request headers
    //     request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //     print("Calling API")
    //     // Perform the request
    //     URLSession.shared.dataTask(with: request) { data, response, error in
    //         guard let data = data, error == nil else {
    //             // Handle error
    //             return
    //         }
            
    //         // Parse the response JSON
    //         if let responseJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
    //            let success = responseJson["isSuccessful"] as? Bool {
    //             DispatchQueue.main.async {
    //                 self.isLoggedIn = success
    //             }
    //         }
    //     }.resume()
    // }
}
