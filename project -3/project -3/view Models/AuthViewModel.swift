//
//  AuthViewModel.swift
//  project -3
//
//  Created by Alanoud  on 05/02/1445 AH.
//

import Foundation
import SwiftUI
class AuthViewModel : ObservableObject {
    @AppStorage ("currentUserId") var currentUserId : String = ""
   
    func singIn(_ id: UserModel.ID) -> Bool {
        currentUserId = id.uuidString
        return true
    }
    
    func signOut() {
        currentUserId = ""
    }
    
    func reset() {
        currentUserId = ""
    }
}
