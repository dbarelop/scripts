#!/usr/bin/nodejs

var bot = require('telegram-bot-bootstrap');
var https = require('https');
var fs = require('fs');
var sh = require('./sh');
var creds = require('./credentials')
var express = require('express');
var http = require('http');
var bodyParser = require('body-parser');

var Alice = new bot(creds.TOKEN);
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
var server = http.createServer(app);

app.post('/forwardinfo', function(req, res) {
    ip_address = req.body.ip_address;
    hostname = req.body.hostname;
    console.log('* request from ' + hostname);
    Alice.sendMessage(creds.CHAT_ID, hostname + '\'s IP address is: ' + ip_address);
    res.send('ok');
});

server.listen(1234);
console.log('Telegram IP info forwarding server started on port %s', server.address().port);
