import Foundation

class SignInViewModel: ObservableObject {
    var storageModel = DataController.shared
    
    @Published var pseudo: String = ""
    @Published var password: String = ""
    @Published var lastName: String = ""
    @Published var firstName: String = ""
    
    var isAlert: Bool = false
        var errorMessage: String = ""
        
//        private func connectUser() {
//            guard pseudo != "" else {
//                isAlert = true
//                errorMessage = "Vous devez écrire au moins une lettre."
//                return nil
//            }
//            guard !pseudo.isEmpty else {
//                isAlert = true
//                errorMessage = "Vous devez écrire au moins une lettre."
//                return nil
//            }
//            guard password != "" else {
//                isAlert = true
//                errorMessage = "Vous devez écrire au moins une lettre."
//                return nil
//            }
//            guard !password.isEmpty else {
//                isAlert = true
//                errorMessage = "Vous devez écrire au moins une lettre."
//                return nil
//            }
////            let user = User(pseudo: pseudo, password: password)
//            print("pseudo is: \(pseudo)\npassword is: \(password)")
//            return user
//        }
    func createUser(pseudo:String, password:String, firstName:String, lastName:String) {
        storageModel.saveUser(pseudo:pseudo, password:password, firstName:firstName, lastName:lastName)
    }
    
    func loginUser(pseudo:String,password:String) {
        storageModel.loginUser(pseudo: pseudo, password: password)
    }
    
    func resetData() {
        pseudo = ""
        password = ""
        firstName = ""
        lastName = ""
    }
}
