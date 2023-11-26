// DEPENDENCIES
const cors = require("cors");
const express = require("express");

// CONFIGURATION
const app = express();

// MIDDLEWARE
app.use(cors()); // Cross Origin Resource Sharing
app.use(express.json());
// app.use("/users", recipesController);

// * * * ROUTES * * *
app.get("/", (req, res) => {
  res.send("Welcome to PenPal!");
});

// USER ROUTES
const usersController = require("./controllers/usersController.js");
const profilesController = require("./controllers/profilesController.js");

app.use("/users", usersController);
app.use("/profiles", profilesController);




// 404 PAGE
app.get("*", (req, res) => {
  res.status(404).send("Page not found");
});

// EXPORT
module.exports = app;

module.exports = app;
