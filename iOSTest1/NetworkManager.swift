//
//  NetworkManager.swift
//  iOSTest1
//
//  Created by Eddi Raimondi on 12/11/2018.
//  Copyright © 2018 Eddi. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase

class NetworkManager: NSObject {
    
    private static var ref: DatabaseReference!
    private static var storageRef: StorageReference!
    
    static func initFirebase(){
        FirebaseApp.configure()
        
        ref = Database.database().reference()
        storageRef = Storage.storage().reference()
    }
    
    static func signup(email: String, password: String, completion: @escaping (Bool) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            // ...
            guard let user = authResult?.user else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    static func login(email: String, password: String, completion: @escaping (Bool) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            // ...
            guard let user = user else {
                completion(false)
                return
            }
            debugPrint(user)
            completion(true)
        }
    }
    
    static func checkLoggedUser(completion: @escaping (Bool) -> ()) {
        if Auth.auth().currentUser != nil {
            // User is signed in
            completion(true)
        } else {
            // No user is signed in
            completion(false)
        }
    }
    
    static func logout(completion: @escaping (Bool) -> ()) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            completion(true)
        } catch let error as NSError {
            print("Error signing out: %@", error)
            
            completion(false)
        }
    }
}
