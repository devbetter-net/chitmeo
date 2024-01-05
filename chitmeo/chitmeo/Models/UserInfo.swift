
import Foundation
class UserInfo: Identifiable, Codable {
    let fullName: String
    let email: String
    
    var initials : String{
        let formatter = PersonNameComponentsFormatter();
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
