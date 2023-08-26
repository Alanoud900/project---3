//
//  HomeView.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//struct HomeView: View {
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userData: UserDataViweModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(userData.posts) { post in
                if let user = userData.fetchUserById(post.createdBy) {
                    NavigationLink(
                        destination: {
                            ScrollView(showsIndicators: false) {
                                PostScreenView(usermodel: user, post: post)
                                ForEach(post.replies, id: \.self) { replyID in
                                    if let reply = userData.fetchPostById(replyID) {
                                        if let replyUser = userData.fetchUserById(reply.createdBy) {
                                            PostScreenView(usermodel: replyUser, post: reply)
                                        }
                                    }
                                }
                            }
                        },
                        label: {
                            PostComponentView(usermodel: user, post: post)
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                    Divider()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUserData = UserDataViweModel()
        // You can customize sampleUserData to match your previews
        
        return HomeView()
            .environmentObject(sampleUserData)
    }
}
