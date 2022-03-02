const express = require('express');
const { MongoClient, ServerApiVersion } = require('mongodb');
const app = express();
app.use(express.json());
require('dotenv').config()

const uri = process.env.MONGO_CONNECTION;
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true, serverApi: ServerApiVersion.v1 });

app.get('/', (req, res) => {
   client.connect(err => {
      if(err) throw err;
      const collection = client.db("myDb").collection("users");        
      collection.find().toArray(function(err, users) {
         if(err) throw err;    
         res.send(JSON.stringify(users))
         client.close();           
      });
    }); 
});

app.get('/freddy', (req, res) => {
   res.send('Say hello to Fred');
});

app.get('/edgesource', (req, res) => {
   res.send('Give a warm welcome to the guys.');
});

app.get('/healthcheck', (req, res) => {
   res.send('API is alive and well.');
});

const port = process.env.PORT || 8081;
app.listen(port, () => console.log(`Listening on port ${port}..`));