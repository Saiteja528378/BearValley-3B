//
//  WallpaperSet.swift
//  BearValley
//
//  Created by sainathreddy on 4/14/17.
//  Copyright © 2017 Arikapudi,Haritha. All rights reserved.
//

import UIKit

class WallpaperSet: UIWindow {

    var wallpaper: UIImage? = UIImage(named: "plain.jpg") {
        didSet {
            // refresh if the image changed
            setNeedsDisplay()
        }
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        //clear the background color of all table views, so we can see the background
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        // draw the wallper if set, otherwise default behaviour
        if let wallpaper = wallpaper {
            wallpaper.draw(in: self.bounds);
        } else {
            super.draw(rect)
        }
    }
}


