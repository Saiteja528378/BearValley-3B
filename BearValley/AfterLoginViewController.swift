//
//  AfterLoginViewController.swift
//  BearValley
//
//  Created by Arikapudi,Haritha on 3/29/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import UIKit

/* After login class to display the alert message and navigate to the next view controller
 */

class AfterLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Home"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(_ animated: Bool) {
    }

}
