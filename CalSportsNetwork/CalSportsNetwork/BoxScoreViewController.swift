//
//  BoxScoreViewController.swift
//  CalSportsNetwork
//
//  Created by Tommy Tai on 12/5/15.
//  Copyright © 2015 Tommy Tai. All rights reserved.
//

import UIKit
import Foundation

class BoxScoreViewController: UIViewController {
    
    
    
    @IBOutlet weak var feedView: UIScrollView!
    @IBOutlet weak var homeTeamImage: UIImageView!
    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamRecord: UILabel!
    @IBOutlet weak var awayTeamRecord: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.homeTeamImage.backgroundColor = UIColor.greenColor()
        self.awayTeamImage.backgroundColor = UIColor.redColor()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFeedForTableView() {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: stats.url)!) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
            
            }
        }
        task.resume()

    }
}
