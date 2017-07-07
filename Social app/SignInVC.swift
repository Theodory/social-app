//
//  ViewController.swift
//  Social app
//
//  Created by Twalipo on 7/5/17.
//  Copyright © 2017 iPF. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore
import FacebookLogin
import SwiftKeychainWrapper

class SignInVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: FancyTextField!
    @IBOutlet weak var paswordField: FancyTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        paswordField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            performAutoLogin()
        }
    }

    @IBAction func facebookBtnPressed(_ sender: Any) {
        let facebookLogin = LoginManager()
        facebookLogin.logIn([.email], viewController: self) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User canceled login")
            case .success( _ , _ , let token):
                print("Logged in successfully")
                let credential = FacebookAuthProvider.credential(withAccessToken: token.authenticationToken)
                
                self.firebaseAuth(credential)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func firebaseAuth(_ credential: AuthCredential ) {
            Auth.auth().signIn(with: credential) { (user, error) in
                if error != nil {
                    print("SIGNIN: Unable to Authenticate with firebase - \(error.debugDescription)")
                } else {
                    print("SIGNIN: successfully authenticated with firebase")
                    if let user = user {
                        self.completeSingIn(user.uid , user , credential.provider)
                    }
                }
        }
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        
        if let email = emailField.text , let password = paswordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("SIGNIN: User auhtenticated successfully")
                    if let user = user {
                       self.completeSingIn(user.uid , user , user.providerID)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                             print("SIGNIN: Problem while authenticating user - \(error.debugDescription)")
                        } else {
                            print("SIGNIN: Email user authenticated successfully email - \(String(describing: user?.email))")
                            if let user = user {
                                self.completeSingIn(user.uid , user , user.providerID )
                            }
                        }
                    })
                }
            })
            
        }
        
    }
    
    func completeSingIn(_ id: String , _ user: User, _ provider: String) {
        var userData = Dictionary<String,String>()
        userData["provider"] = provider
        userData["email"] = user.email!
        
        DataService.ds.createFirebaseDBUser(id, userData: userData)
        
        let keyChainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("SIGNIN: User saved to keychain: \(keyChainResult)")
        performAutoLogin()
    }
    
    func performAutoLogin(){
        performSegue(withIdentifier: "gotToFeed", sender: nil)
    }
}

