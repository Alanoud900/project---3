//
//  postModel.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//
import Foundation
import SwiftUI

struct Postmodel: Identifiable {
    typealias ID = UUID
    let id : ID = .init()
    let content:  String?
    let attachment:Array<URL>
    var likes: Array<UserModel.ID>
    var replies = Array<Postmodel.ID>()
    let createdBy: UserModel.ID
    let date: Date

}
