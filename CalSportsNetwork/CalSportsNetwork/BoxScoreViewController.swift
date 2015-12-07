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
    
    var gamesArray : NSArray = []
    
    @IBOutlet weak var feedView: UIScrollView!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamRecord: UILabel!
    @IBOutlet weak var awayTeamRecord: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let request = NSMutableURLRequest(URL: NSURL(string: "http://ec2-52-26-157-178.us-west-2.compute.amazonaws.com/sports/basketball")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTaskWithRequest(request) { data, response, error in
            guard data != nil else {
                print("no data found: \(error)")
                return
            }

            // this, on the other hand, can quite easily fail if there's a server error, so you definitely
            // want to wrap this in `do`-`try`-`catch`:
            
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSArray {
                    let success = json[0]                                 // Okay, the `json` is here, let's get the value for 'success' out of it
                    print("Success: \(success)")
                } else {
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)    // No error thrown, but not NSDictionary
                    print("Error could not parse JSON: \(jsonStr)")
                }
            } catch let parseError {
                print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
            }
        }
        
        task.resume()
        
        
    }
    
    func requestArray() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFeedForScrollView() {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: "http://ec2-52-26-157-178.us-west-2.compute.amazonaws.com/sports/basketball")!) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                
            }
        }
        task.resume()

    }
}
