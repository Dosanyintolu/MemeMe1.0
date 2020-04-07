//
//  MemesDetailController.swift
//  MemeMe1.0
//
//  Created by Doyinsola Osanyintolu on 4/7/20.
//  Copyright © 2020 DoyinOsanyintolu. All rights reserved.
//

import Foundation
import UIKit


class MemesDetailController: UIViewController {
    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    
    
    var memes: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.memeImage.image = memes.memedImage
        self.bottomText.text = memes.bottomText
        self.topText.text = memes.topText
    }
}
