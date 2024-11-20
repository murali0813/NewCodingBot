app.js file name, below is the content for the file
const express = require('express');
const app = express();
const port = 3000;
app.get('/', (req, res) => {
   res.send('Hello, World! Welcome to the Node.js app!');
});
app.listen(port, () => {
   console.log(`App running on http://localhost:${port}`);
});
