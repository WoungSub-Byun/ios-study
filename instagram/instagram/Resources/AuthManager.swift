//
//  DatabaseManager.swift
//  instagram
//
//  Created by 변웅섭 on 2021/07/13.
//

import FirebaseDatabase
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String) {
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            })
        }
        else if let username = username {
            // username log in
            print(username)
        }
    }
}
