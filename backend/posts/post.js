const express = require('express');
const router = express.Router();
const Post = require('../models/Posts');

router.get("/",(req,res)=>{
    res.send("Welcome to post");
});
module.exports=router;
