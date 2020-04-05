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
    
    
    var memes: [Meme] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.memes
    }
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 2.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return memes.count
    }
    
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! SentMemesCollectionViewCell
        let memes = self.memes[(indexPath as NSIndexPath).row]
        cell.memeImage.image = memes.memedImage
        cell.bottomText.text = "Bottom:\(memes.bottomText)"
        cell.topText.text = "Top:\(memes.topText)"
        
        return cell
    }
    
    @IBAction func memeSegue(_ sender: Any) {
           
           let controller = storyboard?.instantiateViewController(identifier: "MemeController") as! MemeController
           present(controller, animated: true, completion: nil)
       }
    
    
}
