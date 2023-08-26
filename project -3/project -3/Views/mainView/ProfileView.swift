//
//  ProfileView.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    @State var usermodel: UserModel
   @State var post: Postmodel
   
    @EnvironmentObject var userData: UserDataViweModel
    @EnvironmentObject var auth: AuthViewModel
    
    @State var  currentUser: Optional<UserModel> = nil
    @State var currentUserPosts: Array<Postmodel> = []
    

    var body: some View {
        VStack(alignment: .leading){
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        auth.signOut()
                    }, label: {
                        Text("Log Out")
                    }
                    )
                }
                HStack{
                    VStack{
                        Text("Full name")
                            .font(.title)
                        Text("Username")
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    AsyncImage( url: usermodel.image)
                    {result in
                        if let image = result.image{
                            image.resizable()
                                .scaledToFit()
                                .cornerRadius(16)
                        }else {
                            ProgressView()
                        }
                    }
                    .frame(width: 50, height: 50)
                        .cornerRadius(50)
                }
            //bio
                Text("I'm just going to say what we are all thinking and knowing is about to go downity down:‏There is about to be some piping hot tea spillage on here daily that people will be posting and we are all going to be sitting back like:")
                Text("12 followers")
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Edit profile")
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(6.25)
                    
                })
                Button(action: {
                    
                }, label: {
                    Text("Share profile")
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(RoundedRectangle(cornerRadius: 6.25)
                            .stroke(.gray.opacity(0.25)))
                    
                }
                )
                .buttonStyle(.plain)
            }
                }
                .padding(.horizontal)
            //posts
                ScrollView(showsIndicators: false) {
                    ForEach(userData.posts) { post in
                        if let user = userData.fetchUserById(post.createdBy) {
                            NavigationLink(destination: {
                                PostScreenView(
                                    usermodel: user,
                                    post: post)
                            }, label: {
                                PostComponentView(usermodel: user,
                                                  post: post)
                            })
                            .buttonStyle(.plain)
                            Divider()
                        }
                    }
                    
                   

                }
            }
        .onAppear {
            if let uuid = UUID(uuidString: auth.currentUserId){
                if let user = userData.fetchUserById(uuid) {
                    currentUser = user
                }
                currentUserPosts = userData.posts.filter { post in return post.createdBy == uuid }
                
            }
                
            }
        }
        }
    

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user = UserModel(username: "john_doe", fullname: "John Doe", bio: "Hello World!", image: URL(string: "https://example.com/profile.jpg"), followers: [], following: [], posts: [])
        let post = Postmodel(content: "Hello, this is a post content", attachment: [], likes: [], replies: [], createdBy: user.id, date: Date())
        
        return ProfileView(usermodel: user, post: post)
    }
}
