const http = require('http')

http.createServer((request, response) => {
  response.writeHead(200, {
      'Content-Type': 'text/plain'
  })
  response.write('Hello, World!\n')
  response.end();
}).listen(8080);

// Hello.prototype.toString = function() {
//   return "hello world"
// }

// module.exports = Hello
