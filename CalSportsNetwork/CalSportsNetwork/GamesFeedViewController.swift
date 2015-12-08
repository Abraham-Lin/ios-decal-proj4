//
//  GamesFeedViewController.swift
//  CalSportsNetwork
//
//  Created by Tommy Tai on 12/4/15.
//  Copyright © 2015 Tommy Tai. All rights reserved.
//

import UIKit

class GamesFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
   
    
    var homeGames = [String]()
    var awayGames = [String]()
    var homeScore = [String]()
    var awayScore = [String]()
    var games = []
    var cellClickedGameID = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSArray {
                    self.games = json
                    self.tableView.reloadData()
                } else {
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("Error could not parse JSON: \(jsonStr)")
                }
            } catch let parseError {
                print(parseError)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
            }
        }
        
        task.resume()
    }
    
    func loadFeedForScrollView() {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: "http://ec2-52-26-157-178.us-west-2.compute.amazonaws.com/sports/basketball")!) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                
            }
        }
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:GamesFeedCell? = tableView.dequeueReusableCellWithIdentifier("gamesFeedCell") as? GamesFeedCell
        
        if (cell == nil)
        {
            let nib:Array = NSBundle.mainBundle().loadNibNamed("GamesFeedCell", owner: self, options: nil)
            cell = nib[0] as? GamesFeedCell
        }
        
        var a = games[indexPath.row]as? NSDictionary
        var b = a!["home"]as? NSDictionary
        cell!.games1Name!.text = b!["name"] as! String
        
        a = games[indexPath.row]as? NSDictionary
        b = a!["away"]as? NSDictionary
        cell!.games2Name!.text = b!["name"] as! String
        
        a = games[indexPath.row]as? NSDictionary
        b = a!["home"]as? NSDictionary
        cell!.score1!.text = b!["score"] as!String
        
        a = games[indexPath.row]as? NSDictionary
        b = a!["away"]as? NSDictionary
        cell!.score2!.text = b!["score"] as! String
        
        //        print(cell!.score2!.text)
        
        a = games[indexPath.row]as? NSDictionary
        cell!.gameID = a!["gid"] as! String
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        let destination = BoxScoreViewController()
        //        navigationController?.pushViewController(destination, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("BoxScoreViewController") as! BoxScoreViewController
        navigationController?.pushViewController(destination, animated: true)
        performSegueWithIdentifier("goToBoxScore", sender: self)
//        cellClickedGameID = tableView.indexPathForSelectedRow.gameID
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! GamesFeedCell!
        cellClickedGameID = cell.gameID
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "goToBoxScore" {
            let svc = segue.destinationViewController as! BoxScoreViewController
            svc.gameID = cellClickedGameID
        }
    }
    
}
