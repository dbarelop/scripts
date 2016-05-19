#!/usr/bin/node

var bot = require('telegram-bot-bootstrap');
var https = require('https');
var fs = require('fs');
var sh = require('./sh');
var creds = require('./credentials')

var Alice = new bot(creds.TOKEN);

function get_info(cb) {
    sh.execute('hostname -I', function(res) {
        var ip = res.stdout.replace('\n', '');
        sh.execute('hostname', function(res) {
            var hostname = res.stdout.replace('\n', '');
            return cb({ ip: ip, hostname: hostname });
        });
    });
}

get_info(function(info) {
    Alice.sendMessage(creds.CHAT_ID, info.hostname + '\'s IP address is: ' + info.ip);
});
