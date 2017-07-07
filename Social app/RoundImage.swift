//
//  RoundImage.swift
//  Social app
//
//  Created by Twalipo on 7/7/17.
//  Copyright © 2017 iPF. All rights reserved.
//

import UIKit

/// Descroption: Makes any image view that has this class round
class RoundImage: UIImageView {

    override func draw(_ rect: CGRect) {
         super.draw(rect)
        layer.cornerRadius = self.frame.size.width / 2
    }

}
