//
//  PostCell.swift
//  Social app
//
//  Created by Twalipo on 7/7/17.
//  Copyright © 2017 iPF. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var likeBtn: UIImageView!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var captionTv: UITextView!
    @IBOutlet weak var noOfLikesLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
