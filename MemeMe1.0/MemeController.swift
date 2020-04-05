//
//  ViewController.swift
//  SelectingImages
//
//  Created by Doyinsola Osanyintolu on 3/19/20.
//  Copyright © 2020 DoyinOsanyintolu. All rights reserved.
//

import UIKit

class MemeController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var theToolBar: UIToolbar!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var bottomToolBar: UIToolbar!
    
    
    var memeObject: Meme!
    
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor:  UIColor.white,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 25)!,
        NSAttributedString.Key.strokeWidth: 5
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if pictureView.image == nil {
            shareButton.isEnabled = false
        } else {
            shareButton.isEnabled = true
        }
        textField1.delegate = self
        textField2.delegate = self
        textField1.text = "TOP"
        textField2.text = "BOTTOM"
        textField1.textColor = .white
        textField2.textColor = .white
        textField1.defaultTextAttributes = memeTextAttributes
        textField2.defaultTextAttributes = memeTextAttributes
        textField1.textAlignment = .center
        textField2.textAlignment = .center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
        subscribeToKeyboardNotification()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeToKeyboardNotification()
        
    }
    
    @IBAction func selectImages(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        controller.allowsEditing = true
        present(controller, animated: true, completion: nil)
    }
    
   
    
    @IBAction func takingPicture(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .camera
        present(controller, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pictureView.image = image
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
   
    func generateMemeImage() -> UIImage {
        theToolBar.isHidden = true
        bottomToolBar.isHidden = true
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        theToolBar.isHidden = false
        bottomToolBar.isHidden = false
        
        return memedImage
    }
    
    func save() {
        let meme = Meme(topText: textField1.text!, bottomText: textField2.text!, originalImage: pictureView.image!, memedImage: generateMemeImage())
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        if textField1.text == "TOP" && textField1.isTouchInside == true {
            textField1.text = ""
        } else if textField2.text == "BOTTOM" && textField2.isTouchInside == true {
                   textField2.text = ""
               }
      
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField1.text == "" {
            textField1.text = "TOP"
        } else if textField2.text == "" {
            textField2.text = "BOTTOM"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField1.isEditing == true {
            return textField1.resignFirstResponder()
        } else if textField2.isEditing == true {
             return textField2.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func cancelEditing(_ sender: Any) {
        pictureView.image = nil
        textField1.text = nil
        textField2.text = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareImage(_ sender: Any) {
        
        let image = generateMemeImage()
        let activityVC = UIActivityViewController(activityItems:[image], applicationActivities: nil)
        activityVC.completionWithItemsHandler = {(activity, success, items,error) in
            if (success == true) {
                self.save()
                self.dismiss(animated: true, completion: nil)
            } else if (error != nil) {
                print(error!)
            }
        }
        present(activityVC, animated: true, completion: nil)
    
    }

}

extension MemeController {
    
     func subscribeToKeyboardNotification() {
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
         
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
     }
     
     func unsubscribeToKeyboardNotification() {
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
         
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
     }
     
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
          let userInfo = notification.userInfo
          let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
          return keyboardSize.cgRectValue.height
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
          view.frame.origin.y -= getKeyboardHeight(notification)
      }
    
    @objc func keyboardWillHide(_ notification: Notification) {
          view.frame.origin.y = 0
      }
      
}
