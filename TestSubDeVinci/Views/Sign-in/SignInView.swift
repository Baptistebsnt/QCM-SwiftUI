import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    @State var alreadyHaveAnAccount: Bool = true
    
    var body: some View {
        VStack {
            if alreadyHaveAnAccount == true {
                Spacer()
                Text("Se Connecter").font(.system(size: 30, weight: .bold))
                Form {
                    TextField("Pseudo", text: $viewModel.pseudo)
                    TextField("Password", text: $viewModel.password)
                    Button("Submit"){
                        viewModel.loginUser(pseudo: viewModel.pseudo, password: viewModel.password)
                        viewModel.resetData()
                    }.foregroundStyle(.red)
                }.frame(height: 200)
                Text("Don't already have an account? Sign-Up").onTapGesture {
                    alreadyHaveAnAccount = false
                }.underline()
                Spacer()
            }
            else {
                Spacer()
                Text("Créer un compte").font(.system(size: 30, weight: .bold))
                Form {
                    TextField("Pseudo", text: $viewModel.pseudo)
                    TextField("FirstName", text: $viewModel.firstName)
                    TextField("LastName", text: $viewModel.lastName)
                    TextField("Password", text: $viewModel.password)
                    Button("Submit"){
                        viewModel.createUser(pseudo: viewModel.pseudo, password: viewModel.password, firstName: viewModel.firstName, lastName: viewModel.lastName)
                        viewModel.resetData()
                        alreadyHaveAnAccount = true
                    }.foregroundStyle(.red)
                }.frame(height: 290)
                Text("Already have an account? Sign-In").onTapGesture {
                    alreadyHaveAnAccount = true
                }.underline()
                Spacer()
            }
        }
    }
}

#Preview {
    SignInView()
}
