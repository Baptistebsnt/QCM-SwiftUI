import SwiftUI

struct isLoggedView: View {
    var model = Model()
    @State var questionIndex: Int = 0
    @State var showConnexionSheet: Bool = false
    
    var body: some View {
        VStack {
            if questionIndex < model.questions.count {
                Text("Question \(questionIndex + 1) of \(model.questions.count)").padding(.bottom,20)
                Text(model.questions[questionIndex].statement).multilineTextAlignment(.center).font(.system(size: 20))
                List(model.questions[questionIndex].proposal, id: \.self) { answer in
                    Button(answer) {
                        questionIndex += 1
                    }
                    .foregroundStyle(.black)
                }
            } else {
                Text("Test finished").font(.system(size: 45))
//                if let user = LoggedUser.userLogged {
//                    Text("Your score is: \(user.score)").font(.system(size: 20))
//                }
            }
        }
    }
}

#Preview {
    isLoggedView()
}
