//
//  Custom1TableViewCell.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit

class Custom1TableViewCell: UITableViewCell {
@IBOutlet weak var ImageView: UIImageView!
@IBOutlet weak var TeamName: UILabel!
    
    
    override func awakeFromNib() {
// Design for Team Icons
ImageView.layer.borderWidth = 3.0
ImageView.layer.borderColor = UIColor.white.cgColor
ImageView.layer.cornerRadius = 50.0
ImageView.clipsToBounds = false
ImageView.layer.masksToBounds = true
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
