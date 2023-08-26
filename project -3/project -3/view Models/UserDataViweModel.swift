//
//  UserDataViweModel.swift
//  project -3
//
//  Created by Alanoud  on 05/02/1445 AH.
//
import SwiftUI

class UserDataViweModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var posts: [Postmodel] = []
    
    init() {
        generateUsersAndPosts()
        generateFollowersAndLikes()
    }

private func generateRandomReplies() -> [Postmodel] {
           var randomReplies: [Postmodel] = []
           
           for _ in 0..<10 { // Generate 10 random replies
               let reply = Postmodel(
                   content: makeRandomContent(),
                   attachment: makeRondomAttachments(),
                   likes: [],
                   replies: [], // No nested replies for random replies
                   createdBy: users.randomElement()!.id,
                   date: Date()
               )
               
               randomReplies.append(reply)
           }
           
           return randomReplies
       }

    private func generateUsersAndPosts() {
        let maxNumberOfUser = 10
        
        for _ in 0..<maxNumberOfUser {
            let firstAndLastName = makeRandomFullname().components(separatedBy: " ")
            let username = "\(firstAndLastName[0]).\(firstAndLastName[1])".lowercased()
            let fullname = "\(firstAndLastName[0]). \(firstAndLastName[1])".lowercased()
            
            let user = UserModel(
                username: username,
                fullname: fullname,
                bio: "I'm just going to say what we are all thinking...",
                image: URL(string: "https://source.unsplash.com/400x300/?person"),
                followers: [],
                following: [],
                posts: []
            )
            
            users.append(user)
        }
        
        let maxNumberOfPost = maxNumberOfUser * 5

              for _ in 0..<maxNumberOfPost {
                  let userId = users.randomElement()!.id
                  let randomReplies = generateRandomReplies()
                  let replyIds = randomReplies.map { $0.id }

                  let post = Postmodel(
                      content: makeRandomContent(),
                      attachment: makeRondomAttachments(),
                      likes: [],
                      replies: replyIds,
                      createdBy: userId,
                      date: Date()
                  )

                  posts.append(post)
              }
          }
    
    
    
    private func generateFollowersAndLikes() {
        let maxNumberOfUser = 10
        
        for _ in 0..<(maxNumberOfUser * 4) {
            let user1Index = users.indices.randomElement()!
            let user2Index = users.indices.randomElement()!
            
            if user1Index != user2Index {
                let isNotFollowing = !users[user1Index].following.contains(users[user2Index].id)
                
                if isNotFollowing {
                    users[user1Index].following.append(users[user2Index].id)
                    users[user2Index].followers.append(users[user1Index].id)
                }
            }
        }
        
        for _ in 0..<(posts.count * 4) {
            let userIndex = users.indices.randomElement()!
            let postIndex = posts.indices.randomElement()!
            
            if !posts[postIndex].likes.contains(users[userIndex].id) {
                posts[postIndex].likes.append(users[userIndex].id)
            }
        }
    }
    
    func fetchUserById(_ userId: UserModel.ID) -> UserModel? {
        return users.first { $0.id == userId }
    }
    
    func fetchPostById(_ postId: Postmodel.ID) -> Postmodel? {
        return posts.first { $0.id == postId }
    }
    
    func fetchRandomPosts() -> [Postmodel] {
        let numberOfPosts = Int.random(in: 3...10)
        var _posts: [Postmodel] = []
        
        for _ in 0..<numberOfPosts {
            let arrayPost = Postmodel(
                content: makeRandomContent(),
                attachment: makeRondomAttachments(),
                likes: [],
                replies: [],
                createdBy: users.randomElement()!.id,  // Assuming you have a users array defined
                date: Date()
            )
            
            _posts.append(arrayPost)
        }
        
        return _posts
    }
    
    private func makeRandomFullname() -> String {
        let names = """
        Kailee Williams
        Judith Hendrix
        Abel Hays
        Laila Cannon
        Bryan Chan
        Ximena Hogan
        Bryanna Holland
        Lina Cunningham
        Fiona Gray
        Mariela Ewing
        Hadassah Cervantes
        Averi Giles
        Rene Mercado
        Carson Phelps
        Julien Arroyo
        Camille Roth
        Skye Baird
        Dana Lambert
        Madilyn Mcknight
        Journey Arellano
        Kailey Tucker
        Rodrigo Huang
        Jaylyn Allen
        Leon Barnes
        Keyon Glover
        Annie Welch
        Zoie Gilbert
        Makena Santiago
        Tyrese Brock
        Dalton Howell
        Addyson Salinas
        Conrad Lopez
        
        """
        let namesArray = names.components(separatedBy: "\n").filter { !$0.isEmpty }
        return namesArray.randomElement() ?? "Default Name"
    }
    
    private func makeRandomContent() -> String {
        let shouldContainContent = Bool.random()
        if shouldContainContent {
            return "I'm just going to say what we are all thinking and knowing is about to go downity down:‏There is about to be some piping hot tea spillage on here daily that people will be posting and we are all going to be sitting back like:"
        } else {
            return ""
        }
    }
    
    private func makeRondomAttachments() -> [URL] {
        let numberOfImages = Int.random(in: 0...5)
        var arrayOfURLs: [URL] = []
        for _ in 0..<numberOfImages {
            if let url = URL(string: "https://source.unsplash.com/400x300/?random") {
                arrayOfURLs.append(url)
            }
        }
        return arrayOfURLs
    }
}
