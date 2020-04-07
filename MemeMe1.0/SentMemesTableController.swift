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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! SentMemesTableViewCell
        let memes = self.memes[(indexPath as NSIndexPath).row]
        
        cell.topLabel.text = memes.topText
        cell.bottomLabel.text = memes.bottomText
        cell.myImage.image = memes.memedImage

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailMemeController = storyboard?.instantiateViewController(withIdentifier: "MemesDetailController") as! MemesDetailController
        detailMemeController.memes = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController?.pushViewController(detailMemeController, animated: true)
    }
    
    @IBAction func memeSegue(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(identifier: "MemeController") as! MemeController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
}

