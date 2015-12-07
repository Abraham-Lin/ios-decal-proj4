var parseXML = require('xml2js').parseString;
var redis = require('redis');
var badDataString = 'Not real gameid';

var client = redis.createClient();

module.exports = {
    parse: function (data, cb) {
        parseXML(data, cb);
    },
    getTeam: function (tid) {
        // query redis
    },
    getSport: function (sid, cb) {
        // query redis
        client.lrange(sid, 0, -1,  function (err, data) {
            if (!data) {
                cb(null, badDataString);
            } else {
                cb(err, data);
            }
        });
    },
    getGame: function (gid, cb) {
        // query redis
        client.get(gid, function (err, data) {
            if (!data) {
                cb(null, badDataString);
                return;
            }
            var output = {};
            output.gid = gid;
            var result = JSON.parse(data);
            output.time = result.bbgame.$.generated; 
            output.note = result.bbgame.venue[0].notes[0].note[0].$.text;
            output.home = {};
            output.away = {};

            output.home.team = result.bbgame.team[0];
            output.home.stats = result.bbgame.team[0].totals[0];

            output.away.team = result.bbgame.team[1];
            output.away.stats = result.bbgame.team[1].totals[0];

            output.venue = result.bbgame.venue;
            
            output.feed = result.bbgame.plays[0].period;
            
            cb(err, output);
        });
    }
};
