//
//  FeedVC.swift
//  Social app
//
//  Created by Twalipo on 7/7/17.
//  Copyright © 2017 iPF. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func singOutPressed(_ sender: Any) {
        let keyChainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("FEED: Key chain removed success: \(keyChainResult)")
        
        try! Auth.auth().signOut()
        
        dismiss(animated: true, completion: nil)
    }

}
