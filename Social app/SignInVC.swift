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

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    func firebaseAuth(_ credential: AuthCredential) {
            Auth.auth().signIn(with: credential) { (user, error) in
                if error != nil {
                    print("SIGNIN: Unable to Authenticate with firebase - \(error.debugDescription)")
                } else {
                    print("SIGNIN: successfully authenticated with firebase")
                }
        }
    }
}

