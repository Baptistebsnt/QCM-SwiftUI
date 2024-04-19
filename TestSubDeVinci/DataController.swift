import CoreData
import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
    var loginUser = LoggedUser.shared
    
    let container = NSPersistentContainer(name: "UserDataStorage")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveUser(pseudo:String, password:String, firstName:String, lastName:String) {
        let registeredUser = User(context: viewContext)
        registeredUser.pseudo = pseudo
        registeredUser.firstName = firstName
        registeredUser.lastName = lastName
        registeredUser.password = password
        registeredUser.isAdmin = false
        registeredUser.id = UUID()
        
        do {
            try viewContext.save()
            print("Succes")
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    
    func removeUser(user: User) {
        viewContext.delete(user)
        do {
            try viewContext.save()
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    
    func getAllUsers() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func loginUser(pseudo:String, password:String) {
        let users = getAllUsers()
        
        users.forEach{ user in
            if user.pseudo == pseudo {
                if user.password == password {
                    loginUser.setUser(user: user)
                }
            }
            
        }
        
//        func modifyUser(userToFind:User) {
//            var users = getAllUsers()
//            var userToDelete: User? = nil
//            if user.id == userToFind.id {
//                userToDelete = user
//            }
//            
//            viewContext.delete(userToDelete)
//            saveUser(pseudo: userToFind.pseudo, password: userToFind.password, firstName: userToFind.firstName, lastName: userToFind.lastName, grade: userToFind.grade)
//        }
    }
}

