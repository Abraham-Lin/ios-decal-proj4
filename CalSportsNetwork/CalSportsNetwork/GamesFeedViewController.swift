//
//  GamesFeedViewController.swift
//  CalSportsNetwork
//
//  Created by Tommy Tai on 12/4/15.
//  Copyright © 2015 Tommy Tai. All rights reserved.
//

import UIKit

class GamesFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let margins = view.layoutMarginsGuide
        gameView = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.blueColor()
        
        loadVisualElements()
    }
    
    func loadVisualElements() {
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        let offset = height - width
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
