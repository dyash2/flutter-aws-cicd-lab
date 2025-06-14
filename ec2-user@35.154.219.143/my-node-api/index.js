const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send("Hello from server!");
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server running at http://35.154.219.143:${port}`);
});
