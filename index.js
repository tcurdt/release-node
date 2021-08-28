const Version = require('./version')
const Http = require('http')

const port = 8080

console.log(`running ${Version.sha} on port ${port}`)

Http.createServer((request, response) => {
  response.writeHead(200, {
      'Content-Type': 'text/plain'
  })
  response.write('Hello, World!\n')
  response.end();
}).listen(port);
