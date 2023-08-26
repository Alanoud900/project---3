//
//  PostScreenView.swift
//  project -3
//
//  Created by Alanoud  on 06/02/1445 AH.
//

import Foundation
import SwiftUI

struct PostScreenView: View {
    @EnvironmentObject var userData: UserDataViweModel
    var usermodel: UserModel
    var post: Postmodel
    
    private var randomReplies: [Postmodel] {
        post.replies.compactMap { replyId in
            userData.fetchPostById(replyId)
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            PostComponentView(
                usermodel: usermodel,
                post: post)
            Divider()
            ForEach(randomReplies, id: \.id) { reply in
                if let replyUser = userData.fetchUserById(reply.createdBy) {
                    PostComponentView(
                        usermodel: replyUser,
                        post: reply)
                    Divider()
                }
            }
        }
        .buttonStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}
