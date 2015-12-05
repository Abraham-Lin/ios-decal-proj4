//
//  SportsViewController.swift
//  CalSportsNetwork
//
//  Created by Tommy Tai on 12/5/15.
//  Copyright © 2015 Tommy Tai. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let margins = view.layoutMarginsGuide
        gameView = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.blueColor()
        
        loadVisualElements()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
