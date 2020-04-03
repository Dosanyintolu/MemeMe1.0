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
    
    var memes = [Meme]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell")!
        let memes = self.memes[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = memes.topText
        cell.detailTextLabel?.text = memes.bottomText
        cell.imageView?.image = memes.memedImage
        
        return cell
    }
    
}
