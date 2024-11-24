const express = require("express");
const mongoose = require('mongoose');

const app = express();

mongoose.connect('mongodb://root:tejas3498@mongo:27017/?authSource=admin')
  .then(() => console.log('Connected!'))
  .catch((e) => console.log(e));

app.get('/', (req, res) => {
    res.send("<h2>Hii there!!!</h2>");
})

const port = process.env.PORT || 3000;

app.listen(port, () => { console.log(`Listening on ${port}`)});