//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by Mahesh Prasad on 31/08/19.
//  Copyright © 2019 Mahesh Prasad. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userProfileName: UIButton!
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var likesCountLbl: UILabel!
    @IBOutlet weak var postCommentLbl: UILabel!
    @IBOutlet weak var commentCountButton: UIButton!
    
    @IBOutlet weak var dateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
        selectionStyle = UITableViewCell.SelectionStyle.none
        
    }
}
