//
//  SentMemesTableController.swift
//  MemeMe1.0
//
//  Created by Doyinsola Osanyintolu on 3/30/20.
//  Copyright © 2020 DoyinOsanyintolu. All rights reserved.
//

import Foundation
import UIKit

class SentMemesTableController: UITableViewController {
    
    var memes: [Meme] {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                  return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! SentMemesTableViewCell
        let memes = self.memes[(indexPath as NSIndexPath).row]
        
        cell.topLabel.text = "Top: \(memes.topText)"
        cell.bottomLabel.text = "Bottom: \(memes.bottomText)"
        cell.myImage.image = memes.memedImage

        return cell
    }
    
    
    @IBAction func memeSegue(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(identifier: "MemeController") as! MemeController
        present(controller, animated: true, completion: nil)
    }
    
}
