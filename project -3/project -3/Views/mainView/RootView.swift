//
//  ContentView.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//

import SwiftUI

struct RootView: View {
    @State private var isActive = true
    @EnvironmentObject var userData: UserDataViweModel
  //  var time = Time.TimerPublisher()
    @EnvironmentObject var userPrefernce: UserPreferncesViewmodel
//    @State var post: Postmodel
    var body: some View {
        VStack{
            if isActive {
                ZStack{
                    Image("2")
                    
                        .resizable()
                        .frame(width: 90, height: 90)
                    
                        .foregroundColor(.accentColor)
                    VStack{
                        Spacer()
                        
                        Text("From Swift")
                    }
                }
                .padding()
            }
            else{
                OnboardingView( )
            }
            //        if userPrefernce.userPrefernces{
            //        OnboardingView()
            //        }
            //        else{
            //            MainView()
        }
        
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation{
                   self.isActive = false
                }
                
            }
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(UserPreferncesViewmodel())
            //.environmentObject(UserDataViweModel())
    }
}
