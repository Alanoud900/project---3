//
//  PostComponentView.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//
import Foundation
import SwiftUI

struct PostComponentView: View {
    var usermodel: UserModel
    var post: Postmodel
    var body: some View {
        HStack {
            VStack{
                AsyncImage(url:usermodel.image)
                {result in
                    if let image = result.image{
                        image.resizable()
                            .scaledToFit()
                        
                    }else {
                        ProgressView()
                    }
                }
                .frame(width: 50, height: 50)
                    //.cornerRadius(50)
                    .clipShape(Circle())
                Spacer()
            }
            .padding(4)
            // post info
            VStack(alignment: .leading){
                HStack{
                    Text(usermodel.username)
                        .bold()
                    Spacer()
                    Text(makePrettyDate())
                        .foregroundColor(Color.gray)
                    Image(systemName:"ellipsis")
                }
                
                if let content = post.content {
                    Text(content)
                }
                if  post.attachment.count > 0 {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(post.attachment, id:\.self){ post
                                in
                                AsyncImage(url:URL(string:"https://source.unsplash.com/400x300/?random")
                                ){ result in
                                    if let image = result.image{
                                        image
                                            .resizable()
                                            .scaledToFill()
                                        
                                    }else{
                                        ProgressView()
                                    }
                                    
                                }.frame(width: 300, height: 200)
                                
                                    .cornerRadius(8)
                                
                            }
                            Spacer()
                        }
                    }
                }
                
                HStack{
                   // if post.likes.contains(UUID(uuidString: a))
                    
                    Image(systemName:"heart")
                    Image(systemName:"message")
                    Image(systemName:"arrow.2.squarepath")
                    Image(systemName:"location")
                }
                HStack{
                    Text("\(post.replies.count)replies \(post.likes.count) likes")
                        .foregroundColor(Color.gray)
                    
                    
                }
            }
            .padding(4)
        }
        .padding(8)
    }
    func makePrettyDate() -> String {
        let componte = Calendar.current.dateComponents([.minute, .hour, .day],
                                                       from: post.date,
                                                       to: Date()
        )
        
        if let minutesCount = componte.minute {
            if minutesCount >= 60 {
                if let hoursCount = componte.hour {
                    if hoursCount >= 24 {
                        if let dayCount = componte.day {
                            if dayCount >= 28 {
                                return post.date.formatted(date: .long, time: .omitted)
                            } else {
                                return "\(dayCount) d"
                            }
                        }
                    } else {
                        return "\(hoursCount) h"
                    }
                }
                return post.date.formatted(date: .long, time: .omitted)
            } else {
                return "\(minutesCount) m"
            }
        }
        
        // Default value to return in case none of the conditions match
        return ""
    }

}
        
//struct PostComponentView_Previews: PreviewProvider {
//    static var previews: some View {
 //       PostComponentView(post: Postmodel)
//   }
//}
