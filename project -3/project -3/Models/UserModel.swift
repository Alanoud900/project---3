//
//  UserModel.swift
//  project -3
//
//  Created by Alanoud  on 07/02/1445 AH.
//

import Foundation
import SwiftUI

struct UserModel: Identifiable {
    typealias ID = UUID
    let id :ID = .init()
    var username:String
    var fullname:Optional<String>
    var bio: Optional<String>
    var image: Optional<URL>
    var followers: Array<UserModel.ID>
    var following: Array<UserModel.ID>
    var posts: Array<Postmodel.ID>
}
