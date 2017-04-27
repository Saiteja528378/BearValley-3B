//
//  RegisterViewController.swift
//  BearValley
//
//  Created by Arikapudi,Haritha on 3/29/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import UIKit
import Parse
import Bolts
/* Register class which stores the data of the user during the registration procecss */

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    //reset method to clear the contents of the textfields
    @IBAction func reset(_ sender: Any) {
        userName.text = ""
        email.text = ""
        password.text = ""
        phoneNumber.text = ""
        confirmPassword.text = ""
        
    }
    
    //registration method which stores the details taken from the user to the database
    @IBAction func register(_ sender: Any) {
        
        if userName.text! == "" || email.text! == "" || password.text! == "" || phoneNumber.text! == "" || confirmPassword.text! == "" {
            self.displayAlertMessage(msg: "Please enter all the fields")
        }
        //retrieving data form the database
        let reg = PFObject(className: "NewUser")
        reg["emailId"] = email.text
        reg["userName"] = userName.text
        reg["phoneNumber"] = phoneNumber.text
        reg["password"] = password.text
        reg["confirmPassword"] = confirmPassword.text
        reg["firstName"] = firstName.text
        reg["lastName"] = lastName.text
        reg.saveInBackground { (success, error) -> Void in
            if success{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "login2")
                self.present(nextViewController, animated:true, completion:nil)
            }
            else{
                print("error")
            }
        }
    }
    
    //method which uses tap gestures which calls the dismiss keyboard.
    override func viewWillAppear(_ animated: Bool) {
        let tapper = UITapGestureRecognizer(target: self, action:#selector(RegisterViewController.dismissKeyboard))
        tapper.cancelsTouchesInView = false
        view.addGestureRecognizer(tapper)
    }
    
    // function to dismiss the keyboard
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // function to display the alert messages.
    func displayAlertMessage(msg:String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated:true,completion:nil)
        
    }
    
}
