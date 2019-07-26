var Elm = require('./elm').Elm;
var app = Elm.Main.init({ flags: 0 });
app.ports.boot.send('Hello World!');

