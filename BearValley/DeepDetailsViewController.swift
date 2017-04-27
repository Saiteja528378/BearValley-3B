//
//  DeepDetailsViewController.swift
//  BearValley
//
//  Created by sainathreddy on 4/11/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import UIKit
import Parse
import Bolts
/*
 
 DeepDeatilsViewController which displays the details of each house.
 
 */
class DeepDetailsViewController: UIViewController {
    
    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var hname: UILabel!
    @IBOutlet weak var hno: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var contact: UILabel!
    
    @IBOutlet weak var imageData: UIImageView!
    var incomeName: String?
    
    // Retrieving data from the database to display the details of the houses posted
    override func viewDidLoad() {
        
        print("entered deep")
        super.viewDidLoad()
        
        
        hname.text = incomeName
        
        let query = PFQuery(className: "House")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if error == nil{
                for obj in objects!{
                    
                    let houseName = obj["name"] as? String
                    
                    
                    
                    if houseName == self.incomeName {
                        
                        self.owner.text = obj["owner"] as? String
                        self.hname.text = obj["name"] as? String
                        self.hno.text = obj["Hno"] as? String
                        self.street.text = obj["street"] as? String
                        self.city.text = obj["city"] as? String
                        self.contact.text = obj["contactNo"] as? String
                        if var imageFile = obj["homeImage"] as! PFFile?{
                            
                            imageFile.getDataInBackground { (AvatarImage, err) in
                                if (err == nil) {
                                    self.imageData.image = UIImage(data: AvatarImage!)
                                }
                            }
                        }
                        
                    }
                    
                }
            }
        }
        
        
    }
    
    //Use of a tap gesture which invokes the dismisskeyboard method
    override func viewWillAppear(_ animated: Bool) {
        let tapper = UITapGestureRecognizer(target: self, action:#selector(DeepDetailsViewController.dismissKeyboard))
        
        tapper.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapper)
    }
    
    //dismiss the keyboard after touching the screen
    func dismissKeyboard() {
        
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        
        view.endEditing(true)
        
    }
    
    // Back button which goes to the previous screen
    @IBAction func backButtonClicked(_ sender: Any) {
        print("entered")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "houses") as? HouseTableViewController
        
        
        
        //print("hhahaha \(calling.d[indexPath.row].name)")
        //print(nextViewController?.incomeName)
        self.present(nextViewController!, animated:true, completion:nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // We tried working on including maps based on the users input address, but we are facing few issues so we commented it.
    
//    let baseUrl = "https://maps.googleapis.com/maps/api/geocode/json?"
//    let apikey = "YOUR_API_KEY"
//    
    
    //    @IBAction func mapSet(_ sender: Any) {
    //
    //        getLatLngForZip(zipCode: "95014")
    //    }
    
    
    //    func getLatLngForZip(zipCode: String) {
    //        let url = NSURL(string: "\(baseUrl)address=\(zipCode)&key=\(apikey)")
    //        let data = NSData(contentsOf: url! as URL)
    //        let json = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
    //        if let result = json["results"] as? NSArray {
    //            if let geometry = result[0] as? NSDictionary {
    //                if let location = geometry["location"] as? NSDictionary {
    //                    let latitude = location["lat"] as! Float
    //                    let longitude = location["lng"] as! Float
    //                    print("\n\(latitude), \(longitude)")
    //                }
    //            }
    //        }
    //    }
    
    
}
