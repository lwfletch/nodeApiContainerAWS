const express = require('express');
const app = express();
app.use(express.json());
 
 
app.get('/', (req, res) => {
   res.send('Welcome to Node API by Trey');
});

const port = process.env.PORT || 8081;
app.listen(port, () => console.log(`Listening on port ${port}..`));