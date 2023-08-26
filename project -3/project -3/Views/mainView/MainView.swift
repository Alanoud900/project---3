//
//  MainView.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//

import SwiftUI

struct MainView: View {
    enum Screen: String ,CaseIterable{
        case home
        case search
        case NewPost
        case Actifity
        case Profile
        
        
        var title: String{
            switch self {
            case.home: return"Home"
            case.search: return"Search"
            case.NewPost: return"NewPost"
            case.Actifity: return"Actifity"
            case.Profile: return"Profile"
            }
        }
        
        var body: AnyView {
            switch self {
            case .home: return AnyView(HomeView())
            case .search: return AnyView(SearchView())
            case .NewPost: return AnyView(NewPostView())
        case .Actifity: return AnyView(ActivityView())
            case .Profile:
                let user = UserModel(username: "john_doe", fullname: "John Doe", bio: "Hello World!", image: URL(string: "https://example.com/profile.jpg"), followers: [], following: [], posts: [])
                let post = Postmodel(content: "Hello, this is a post content", attachment: [], likes: [], replies: [], createdBy: user.id, date: Date())
                return AnyView(ProfileView(usermodel: user, post: post))
            }
        }

        
        var image: String{
            switch self {
            case.home: return"house"
            case.search: return"magnifyingglass"
            case.NewPost: return"plus"
            case.Actifity: return"heart"
            case.Profile: return"person"
            }
        }
        
    }
    
    @State var currentTitle: String = "Home"
    @State var shouldPresent: Bool = false
    var body: some View {
        NavigationView{
            TabView{
                
                ForEach(Screen.allCases, id: \.self) {
                    screen in
                        screen.body
                        .tabItem {
                Image(systemName: screen.image)
                Text( screen.title)
                }
                .onAppear(){
            currentTitle = screen.title
                }
            }
                  
    
                
            }.navigationTitle(currentTitle)
            .navigationBarBackButtonHidden(true)
            //.sheet(isPresented: $shouldPresent) {
                
            }
        }
    }


                                      

struct MainView_Previews: PreviewProvider {
   static var previews: some View {
       MainView()
           .environmentObject(UserPreferncesViewmodel())
           .environmentObject(UserDataViweModel())
    }
}
