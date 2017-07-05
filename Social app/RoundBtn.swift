//
//  RoundBtn.swift
//  Social app
//
//  Created by Twalipo on 7/5/17.
//  Copyright © 2017 iPF. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.size.width / 2
    }

}
