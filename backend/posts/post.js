const express = require("express");
const router = express.Router();
const Post = require("../models/Posts");

//Get All posts
router.get("/", async (req, res) => {
  try {
    const post = await Post.find();
    res.json(post);
  } catch (err) {
    res.json(err);
  }
});

///Delete single post
router.delete("/:postId", async (req, res) => {
  try {
    const deletedPost = await Post.deleteOne({
      _id: req.params.postId,
    });
    res.json(deletedPost);
  }
  catch (err) {
    res.json(err);
  }
});

//Edit post we will edit title and body both
router.patch("/:postId", async (req, res) => {
  try {
    const updatedPost = await Post.updateOne(
      { _id: req.params.postId },
      { $set: { title: req.body.title, body: req.body.body } }
    );
    res.json(updatedPost);
  } catch (err) {
    res.json(err);
  }
});

//Submit post
router.post("/", async (req, res) => {
  const post = new Post({
    title: req.body.title,
    body: req.body.body,
    date: Date.now(),
  });
  try {
    const addedUser = await post.save();
    res.json(addedUser);
  } catch (err) {
    res.json(err);
  }
});

module.exports = router;
