//
//  Custom3TableViewCell.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit

class Custom3TableViewCell: UITableViewCell {
@IBOutlet weak var ImageView2: UIImageView!
@IBOutlet weak var ImageView1: UIImageView!
@IBOutlet weak var Team1: UILabel!
@IBOutlet weak var Team2: UILabel!
@IBOutlet weak var Venue: UILabel!
@IBOutlet weak var MatchNumber: UILabel!
@IBOutlet weak var DateandTime: UILabel!
    

override func awakeFromNib() {

//Design for UI Outlets
ImageView1.layer.borderWidth = 3.0
ImageView1.layer.cornerRadius = 50.0
ImageView1.layer.borderColor = UIColor.white.cgColor
ImageView1.clipsToBounds = false
ImageView1.layer.masksToBounds = true
ImageView2.layer.borderWidth = 3.0
ImageView2.layer.cornerRadius = 50.0
ImageView2.layer.borderColor = UIColor.white.cgColor
ImageView2.clipsToBounds = false
ImageView2.layer.masksToBounds = true
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
