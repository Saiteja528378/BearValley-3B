//
//  EnterNameViewController.swift
//  BearValley
//
//  Created by Arikapudi,Haritha on 4/18/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import UIKit
import Parse
import Bolts
/*
 Enter name class which takes the name and ssn from the users
 */

class EnterNameViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var ssn: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //unwind function
    func unwind(for unwindSegue: UIStoryboardSegue) {
        
    }
    
    // method to navigate to the next view ontroller
    @IBAction func buttonClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "postDetail") as? PostDetailsViewController
        nextViewController?.name = self.name.text
        nextViewController?.ssn = self.ssn.text
        self.present(nextViewController!, animated:true, completion:nil)
    }
}
