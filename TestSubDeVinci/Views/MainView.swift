import SwiftUI

struct MainView: View {
    @State var IsNotLogged = true
    @StateObject var loggedUser = LoggedUser.shared
    
    var body: some View {
        if loggedUser.userLogged != nil {
            isLoggedView()
        } else {
            isNotLoggedView()
        }
    }
}

#Preview {
    MainView()
}
