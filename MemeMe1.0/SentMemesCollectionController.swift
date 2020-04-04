//
//  SentMemesCollectionController.swift
//  MemeMe1.0
//
//  Created by Doyinsola Osanyintolu on 3/30/20.
//  Copyright © 2020 DoyinOsanyintolu. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionController: UICollectionViewController {
    
    
    var memes = [Meme]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return memes.count
    }
    
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! SentMemesCollectionViewCell
        let memes = self.memes[(indexPath as NSIndexPath).row]
        cell.memeImage.image = memes.memedImage
        cell.bottomText.text = memes.bottomText
        cell.topText.text = memes.topText
        
        return cell
    }
    
    @IBAction func memeSegue(_ sender: Any) {
           
           let controller = storyboard?.instantiateViewController(identifier: "MemeController") as! MemeController
           present(controller, animated: true, completion: nil)
       }
    
    
}
