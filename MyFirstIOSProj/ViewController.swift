//
//  ViewController.swift
//  MyFirstIOSProj
//
//  Created by Mark Sun on 10/9/16.
//  Copyright © 2016 Mark Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        textbox.delegate = self
    }
    
    // MARK: Properties
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var textbox: UITextField!
    @IBOutlet weak var imageBox: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    // MARK: Actions
    @IBAction func touchButton(sender: UIButton) {
        showPhotoLibPicker()
    }
    @IBAction func touchImage(sender: UITapGestureRecognizer) {
        showPhotoLibPicker()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        myLabel.text = textField.text?.uppercaseString
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        imageBox.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showPhotoLibPicker () {
        // Hide the keyboard.
        textbox.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }

}

