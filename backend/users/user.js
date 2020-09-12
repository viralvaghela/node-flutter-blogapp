const express = require("express");

const router = express.Router();

const User = require("../models/User");

//Get Specific User
router.get("/:userId", async (req, res) => {
  try {
    const user = await User.findById(req.params.userId);
    res.json(user);
  } catch (err) {
    res.json({ message: err });
  }
});

//Delete a specific user
router.delete("/:userId", async (req, res) => {
  try {
    const deletedUser = await User.remove({ _id: req.params.userId });
    res.send(deletedUser);
  } catch (err) {
    res.json({ message: err });
  }
});

//Update one user
router.patch("/:userId", async (req, res) => {
  try {
    const updatedUser = await User.updateOne(
      { _id: req.params.userId },
      { $set: { name: req.body.name } }
    );
    res.json(updatedUser);
  } catch (err) {
    res.json({ message: err });
  }
});

//Get all user
router.get("/", async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  } catch (err) {
    res.json({ message: err });
  }
});

// Register User
router.post("/", async (req, res) => {
  const user = new User({
    name: req.body.name,
    email: req.body.email,
    password: req.body.password,
  });
  try {
    const savedUser = await user.save();
    res.send(savedUser);
  } catch (err) {
    res.status(400).send(err);
  }
});

module.exports = router;