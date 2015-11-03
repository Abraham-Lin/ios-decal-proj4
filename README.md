CSN (Cal Sports Network)
========================

Authors
-------
-Tommy Tai
-Jonathan Bai
-Abraham Lin
-Cindy Tung

Purpose
-------
Create App for only CAL sports so that users can access scores easily without the need to google search or use the ESPN app.

Features
--------
*Scores
*Upcoming Games
*Sports: Basketball, Swimming, Tennis, Baseball
*Link to actual score page embedded (more information)
*Wikipedia Recommendation
*Box Score

Control Flow
------------
*First view is a table view of sports scores by date
*Under each game will be the score, box score, and more details pertaining to that game
*Hamburger button to select any sport
*Nested within is a table view of all scores pertaining to that sport

Implementation
--------------

###Model
*Player object, inherit from game.swfit, player would have stats specific to game

###View
*SchedulesTableView, GamesTableView, SportTableView, PlayerTableView

###Controller
*SchedulesTableViewController, GamesTableViewController, SportTableViewController, PlayerTableViewController
