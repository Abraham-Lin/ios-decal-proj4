CSN (Cal Sports Network)
========================

Authors
-------
* Tommy Tai
* Jonathan Bai
* Abraham Lin
* Cindy Tung

Purpose
-------
To create an app for only CAL sports so that users can access scores easily without the need to google search or use the ESPN app.

Features
--------
* Scores/Box Score
* Upcoming Games
* Sports: Basketball, Swimming, Tennis, Baseball
* Team Roster
* Link to actual score page embedded (more information)

Control Flow
------------
* First view is a table view of sports scores by date
* Hamburger button to select any sport
* Nested within the hamburger button is a table view of all games played pertaining to that sport
* Under each game will be the score, box score, and more details pertaining to that game
* Under a specific sport section, can swipe right to view team roster and all information pertaining to each team member 


Implementation
--------------

###Model
* Player object, inherit from game.swfit, player would have stats specific to game
* Fetch data from CAL sports API (For scores, upcoming games, etc...)
* Player object also inherits from roster.swift, containing all roster information about the player

###View
* SchedulesTableView, GamesTableView, SportTableView, PlayerTableView, RosterTableView

###Controller
* SchedulesTableViewController, GamesTableViewController, SportTableViewController, PlayerTableViewController, RosterTableViewController
