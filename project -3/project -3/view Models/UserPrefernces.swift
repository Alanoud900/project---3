//
//  UserPrefernces.swift
//  project -3
//
//  Created by Alanoud  on 04/02/1445 AH.
//

import Foundation
import SwiftUI

class UserPreferncesViewmodel: ObservableObject{
//    @AppStorage ("userprefernce") var token: String = ""
    @Published  var userPrefernces: Bool = false
}
