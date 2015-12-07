var redis = require('redis');
var request = require('request');
var JSFtp = require("jsftp");
var fs = require('fs');
var async = require('async');
var _ = require('underscore');

var client = redis.createClient();
var Ftp = new JSFtp({
    'host': 'ftp.calstats.net',
    'port': 21,
    'user': 'calstats.net-mbb',
    'pass': 'C@lMbbTt@i! '
});

function warmup_help(fname, cb) {
    Ftp.get(fname, fname, function(err) {
        if (err) {
            console.log(err);
        }
        fs.readFile(fname, function (err, d) {
            var parseString = require('xml2js').parseString;
            parseString(d, function (err, data) {
                var gid = data.bbgame.venue[0].$.gameid;
                //console.log(gid);
                if (err) {
                    console.log(err);
                    return;
                }
                var input = JSON.stringify(data);
                if (!input) return;
                client.get(gid, function (err, check_data) {
                    if (!check_data) {
                        client.lpush('basketball', input);
                    }
                    if (!check_data || check_data != input) {
                        client.set(gid, input);
                    }
                    cb();
                }); 
            });
        });
    });
}

function warmup() {
    var files = [];
    Ftp.ls(".", function(err, data) {
        var fns = [];
        _.each(data, function (elem) {
            fns.push(function (cb) {
                warmup_help(elem.name, cb);
            });
        });
        async.series(fns);
    });
}

client.on('connect', function() {
    var curDate = new Date();
    var parseString = require('xml2js').parseString;
    function runEvery() {
        Ftp.get('./cal.xml', './cal.xml', function(err) {
            if (err) {
                console.log(err);
            }
            fs.readFile('cal.xml', function (err, d) {
                parseString(d, function (err, data) {
                    if (!data) {
                        return;
                    }
                    if (err) {
                        console.log(err);
                        return;
                    }
                    var gid = data.bbgame.venue[0].$.gameid;
                    var input = JSON.stringify(data);
                    if (!input) return;
                    client.get(gid, function (err, check_data) {
                        if (!check_data) {
                            client.lpush('basketball', input);
                        }
                        if (!check_data || check_data != input) {
                            client.set(gid, input);
                        }
                    }); 
                });
            });
        });
    }
    setInterval(runEvery, 5000);
});

warmup();
