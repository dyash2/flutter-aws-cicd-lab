const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send("Updated from GitHub CI/CD!");
});

app.get('/status', (req, res) => {
  res.json({ status: 'Running', timestamp: new Date() });
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server is live at http://35.154.219.143:${port}`);
});
