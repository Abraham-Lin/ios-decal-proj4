//
//  GamesFeedCell.swift
//  CalSportsNetwork
//
//  Created by Cindy Tung on 12/7/15.
//  Copyright © 2015 Tommy Tai. All rights reserved.
//

import UIKit

class GamesFeedCell: UITableViewCell {
    

    @IBOutlet weak var games1Name: UILabel!
    @IBOutlet weak var games2Name: UILabel!
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    var gameID = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization codea
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
