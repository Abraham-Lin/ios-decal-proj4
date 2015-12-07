//
//  GamesFeedViewController.swift
//  CalSportsNetwork
//
//  Created by Tommy Tai on 12/4/15.
//  Copyright © 2015 Tommy Tai. All rights reserved.
//

import UIKit

class GamesFeedViewController: UIViewController, UITableViewDelegate {

    var cellContent = ["Mens Basketball", "Womens Basketball", "Mens Football", "Womens Volleyball"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Sports-Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
    }
    
    
}
