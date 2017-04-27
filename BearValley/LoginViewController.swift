//
//  LoginViewController.swift
//  BearValley
//
//  Created by Arikapudi,Haritha on 3/29/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import UIKit
import Parse
import Bolts

/*
 LoginViewControllers which helps user to login by validating the username and password
 */
class LoginViewController: UIViewController {
    var regUser:[PFObject]!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    //login fucntion which checks the matching of the user typed username and passwords with the stored details
    @IBAction func login(_ sender: Any) {
        if userName.text == "" || password.text == "" {
            self.displayAlertMessage(msg: "Please enter the details")
        }
        let query = PFQuery(className:"NewUser")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // tranversing through the retrieved objects.
                for object in objects! {
                    let username = object["userName"] as? String
                    let paswd = object["password"] as? String
                    if username == self.userName.text! && paswd == self.password.text! {
                        //calling goto function to navigate to the next view controller after successful login
                        self.goto()
                        break
                    }
                }
            }
            else {
                self.displayAlertMessage(msg: "Wrong credientals! Try again")
            }
        }
    }
    
    // fucntion to display alert messages
    func displayAlertMessage(msg:String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated:true,completion:nil)
    }
    
    // fucntion to navigate to the next view controller
    func goto(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "after") as! AfterLoginViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
}
