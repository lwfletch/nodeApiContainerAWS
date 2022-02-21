const express = require('express');
const app = express();
app.use(express.json());
 
 
app.get('/', (req, res) => {
   res.send('Welcome to my API built in NodeJS by Trey Fletcher');
});

const port = process.env.PORT || 8081;
app.listen(port, () => console.log(`Listening on port ${port}..`));