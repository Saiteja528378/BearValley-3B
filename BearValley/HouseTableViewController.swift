//
//  HouseTableViewController.swift
//  BearValley
//
//  Created by sainathreddy on 4/2/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import UIKit
import Parse
import Bolts
/*
 HouseTableViewController which display the list houses available for rentals
 */
class HouseTableViewController: UITableViewController {
    //creating an object for Details class
    var calling = Details()
    
    //calling createModel method of details class
    override func viewDidLoad() {
        super.viewDidLoad()
        calling.createModel()
        sleep(2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //No of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //No of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calling.d.count
    }
    
    //Contents displayed in each row. Displaying the name and city of the houses.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = calling.d[indexPath.row].name
        cell.detailTextLabel?.text = calling.d[indexPath.row].detials
        return cell
    }
    
    //navigating to the next view controller when clicking on the detials link
    public override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "d1") as? DeepDetailsViewController
        nextViewController?.incomeName = calling.d[indexPath.row].name
        self.present(nextViewController!, animated:true, completion:nil)
    }
    
    
}
