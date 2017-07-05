//
//  FancyView.swift
//  Social app
//
//  Created by Twalipo on 7/5/17.
//  Copyright © 2017 iPF. All rights reserved.
//

import UIKit

private var roundConnerKey: Bool = false
private var shadowKey: Bool = false


extension UIView {
    
    @IBInspectable var hasRoundConner: Bool {
        get {
            return roundConnerKey
        }
        set {
            
            roundConnerKey = newValue
            
            if roundConnerKey {
                layer.cornerRadius = 3.0
            } else {
                layer.cornerRadius = 0.0
            }
        }
    }
    
    @IBInspectable var hasShadow: Bool {
        get {
            return shadowKey
        }
        
        set {
            shadowKey = newValue
            
            if shadowKey {
                layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
                layer.shadowOpacity = 0.8
                layer.shadowRadius = 5.0
                layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            } else {
                layer.shadowColor = nil
                layer.shadowOpacity = 0
                layer.shadowRadius = 0
                layer.shadowOffset = CGSize.zero
            }
        }
    }
    

}
