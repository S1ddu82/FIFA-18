//
//  Custom2TableViewCell.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit

class Custom2TableViewCell: UITableViewCell {
let Delegate = UIApplication.shared.delegate as! AppDelegate

@IBOutlet weak var Venue: UILabel!
@IBOutlet weak var DateandTime: UILabel!
@IBOutlet weak var MatchNumber: UILabel!
@IBOutlet weak var Team1: UILabel!
@IBOutlet weak var Team2: UILabel!
@IBOutlet weak var Button1: UIButton!
@IBOutlet weak var Button2: UIButton!
    

@IBAction func Action1(_ sender: Any) {
Delegate.Image1 = Team1.text
}
    
@IBAction func Action2(_ sender: Any) {
Delegate.Image2 = Team2.text
}
    
    
override func awakeFromNib() {
//Design for UI Outlets
Button1.layer.borderWidth = 3.0
Button1.layer.borderColor = UIColor.white.cgColor
Button1.layer.masksToBounds = false
Button1.clipsToBounds = true
Button1.layer.cornerRadius = 50.0
Button2.layer.borderWidth = 3.0
Button2.layer.borderColor = UIColor.white.cgColor
Button2.layer.masksToBounds = false
Button2.clipsToBounds = true
Button2.layer.cornerRadius = 50.0




        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
