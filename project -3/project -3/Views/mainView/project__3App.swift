//
//  project__3App.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//

import SwiftUI

@main
struct project__3App: App {
    @ObservedObject var userPrefernce = UserPreferncesViewmodel()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var userData = UserDataViweModel()
//    @State var post: Postmodel
    var body: some Scene {
        WindowGroup {
          //  NavigationView{
                RootView()
                    .environmentObject(userPrefernce)
                    .environmentObject(auth)
                    .environmentObject(userData)
            }
        }
    }

