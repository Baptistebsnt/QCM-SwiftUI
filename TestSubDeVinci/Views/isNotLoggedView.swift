import SwiftUI

struct isNotLoggedView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Bienvenue dans l'application de QCM")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink("Se connecter" ) {
                    SignInView()
                }
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    isNotLoggedView()
}
