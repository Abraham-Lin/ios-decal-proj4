var express = require('express');
var bodyParser = require('body-parser');
var path = require('path');
var _ = require('underscore');
var request = require('request');
var util = require('./util');


var app = express();
var http = require('http').Server(app);

// In order to track of req's body. ;)
app.use(bodyParser.urlencoded({
    extended: false
}));

//app.use(bodyParser.json());

//Routes
app.get('/', function (req, res) {
    res.send('its ok');
});
app.get('/games/:gameid', function (req, res) {
    var id = req.params.gameid;
    util.getGame(id, function (err, data) {
        if (err) {
            res.send(err);
        } else {
            res.send(data);
        }
    });
});

app.get('/sports/:sportname', function (req, res) {
    var name = req.params.sportname;
    util.getSport(name, function (err, data) {
        if (err) {
            res.send(err);
        } else {
            res.send(data);
        }
    });

});

//server
var server = http.listen(80, function() {
    console.log('Listening on port %d', server.address().port);
});
