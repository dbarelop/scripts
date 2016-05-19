var exec = require('child_process').exec;

exports.execute = function(cmd, cb) {
    var options = {
        timeout: 10000,
        killSignal: 'SIGKILL'
    };
    exec(cmd, options, function(err, stdout, stderr) {
        if (err) {
            console.log(err);
        }
        return cb({ err: err, stdout: stdout, stderr: stderr });
    });
}
