//
//  OnboardingView.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//
import SwiftUI

enum Presented {
    case authentication
    case mainView
}

struct OnboardingView: View {
    @State var p: Presented = .authentication
    @EnvironmentObject var userData: UserDataViweModel
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        switch p {
        case .authentication:
            VStack {
                Image("1")
                    .resizable()
                    .scaledToFit()
                Spacer()
                
                Button(action: {
                    if let userId = userData.users.first?.id {
                        let didSignInSuccessfully = auth.singIn(userId) // Call your signIn method from AuthViewModel
                        p = didSignInSuccessfully ? .mainView : .authentication
                    }
                }, label: {
                    Text("Log In")
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
                .padding()
                .foregroundColor(.white)
                .bold()
            }
        case .mainView:
            MainView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(UserDataViweModel())
            .environmentObject(AuthViewModel())
    }
}
