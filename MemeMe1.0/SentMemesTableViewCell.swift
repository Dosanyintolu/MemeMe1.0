//
//  SentMemesTableViewCell.swift
//  MemeMe1.0
//
//  Created by Doyinsola Osanyintolu on 4/4/20.
//  Copyright © 2020 DoyinOsanyintolu. All rights reserved.
//

import UIKit

class SentMemesTableViewCell: UITableViewCell {
    
       @IBOutlet weak var myImage: UIImageView!
       @IBOutlet weak var topLabel: UILabel!
       @IBOutlet weak var bottomLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
