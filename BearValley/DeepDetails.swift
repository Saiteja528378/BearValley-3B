//
//  DeepDetails.swift
//  BearValley
//
//  Created by sainathreddy on 4/11/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import Foundation

/*
A model class display the complet details of the house.
 with varibales:
 name -  name of the house
 owner - name of the owner
 address - address of the house
 phoneNumber - contact numb of the owner
 
*/
class DeepDetails{
    
    var name: String
    var owner: String
    var address: String
    var phoneNumber: String
    
    init(name: String, owner: String, address: String, phoneNumber: String){
        self.name = name
        self.owner = owner
        self.address = address
        self.phoneNumber = phoneNumber
        
    }
    
    
}
