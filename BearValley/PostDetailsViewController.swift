//
//  PostDetailsViewController.swift
//  BearValley
//
//  Created by sainathreddy on 4/13/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import UIKit
import Parse
import Bolts
/*
 PostDetailsViewController class which takes the house details from the user
 */

class PostDetailsViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // variables to store the name and ssn
    var name: String?
    var ssn: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var hname: UITextField!
    @IBOutlet weak var houseNo: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var contactNo: UITextField!
    @IBOutlet weak var rent: UITextField!
    @IBOutlet weak var rooms: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var parseImageFile:PFFile!
    
    // reset function to clear the text fields
    @IBAction func reset(_ sender: Any) {
        hname.text = ""
        houseNo.text = ""
        street.text = ""
        city.text = ""
        contactNo.text = ""
        rent.text = ""
        rooms.text = ""
        email.text = ""
    }
    
    // fucntion which uses tap gesture calling dismissKeyboard method
    override func viewWillAppear(_ animated: Bool) {
        let tapper = UITapGestureRecognizer(target: self, action:#selector(PostDetailsViewController.dismissKeyboard))
        tapper.cancelsTouchesInView = false
        view.addGestureRecognizer(tapper)
    }
    
    //Method which dismiss the keyboard
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //image picker cancel method
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // image picker controller method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = selectedPhoto
        let imageData = UIImagePNGRepresentation(self.imageView.image!)
        //create a parse file to store in cloud
        let prfname = "Profile.png"
        parseImageFile = PFFile(name: prfname, data: imageData!)
        dismiss(animated: true, completion: nil)
    }
    
    // method to enable the user to select the picture from the gallery
    @IBAction func addPicture(_ sender: Any) {
        print("Tapped on profile picture")
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // Method which uses to post the details taken from the user to the database
    @IBAction func post(_ sender: Any) {
        if hname.text == "" || houseNo.text == "" || street.text == "" || city.text == "" || contactNo.text == "" || rent.text == "" || rooms.text == "" || email.text == "" {
            self.displayAlertMessage(msg: "Please fill all the details")
        }
        let post = PFObject(className: "House")
        post["owner"] = self.name
        post["name"] = self.hname.text
        post["Hno"] = self.houseNo.text
        post["street"] = self.street.text
        post["city"] = self.city.text
        post["contactNo"] = self.contactNo.text
        post["rent"] = self.rent.text
        post["rooms"] = self.rooms.text
        post["email"] = self.email.text
        post["homeImage"] = parseImageFile
        post.saveInBackground{ (success, error) -> Void in
            if success{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "postSuccess")
                self.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
    
    // function to display the alert message
    func displayAlertMessage(msg:String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated:true,completion:nil)
    }
    
}

