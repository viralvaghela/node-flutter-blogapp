const express = require("express");
const mongooes = require("mongoose");
const bodyParser = require("body-parser");
require("dotenv/config");

const app = express();

app.use(bodyParser.urlencoded());
app.use(bodyParser.json());

const postRoute = require("./posts/post");
const userRoute = require("./users/user");

app.use("/user", userRoute);
app.use("/post",postRoute);


app.get("/", (req, res) => {
  res.send("Welcome");
});

mongooes.connect(process.env.DB_CONNECTION, { useNewUrlParser: true,useUnifiedTopology: true  }, () =>
  console.log("Connected")
);

app.listen(4000);
