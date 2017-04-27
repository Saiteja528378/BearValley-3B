//
//  Details.swift
//  BearValley
//
//  Created by sainathreddy on 4/2/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import Foundation
import Parse
import Bolts

/* Details class for retrieving data from the data store
 */
class Details{
    
    var d:[HouseDetails] = []
    var d2:[DeepDetails] = []
    var housename = ""
    let query = PFQuery(className: "House")
    func createModel(){
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if error == nil{
                for obj in objects!{
                    
                    self.housename = (obj["name"] as? String)!
                    let houseaddress = obj["city"] as? String
                    let owner = obj["owner"] as? String
                    let phoneNumber = obj["contactNo"] as? String
                    self.d.append(HouseDetails(name: self.housename, details: houseaddress!))
                    self.d2.append(DeepDetails(name: self.housename, owner: owner!, address: houseaddress!, phoneNumber: phoneNumber!))
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "d1") as? DeepDetailsViewController
                }
                
            }
        }
        
    }
    
}
