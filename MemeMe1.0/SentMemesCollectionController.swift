//
//  SentMemesCollectionController.swift
//  MemeMe1.0
//
//  Created by Doyinsola Osanyintolu on 3/30/20.
//  Copyright © 2020 DoyinOsanyintolu. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var memes = [Meme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! SentMemesCollectionViewCell
        let memes = self.memes[(indexPath as NSIndexPath).row]
        cell.memeImage.image = memes.memedImage
        cell.bottomText.text = memes.bottomText
        cell.topText.text = memes.topText
        
        return cell
    }
    
    
}
