const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
require("dotenv").config();
const mysql = require("mysql2/promise");
const { upload } = require("./upload");
const Joi = require("joi");

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
});

const schema = Joi.object({
  id: Joi.string(),
  name: Joi.string().trim().required(),
  title: Joi.string().trim(),
  company: Joi.string().allow(""),
  phone: Joi.string().allow(""),
  email: Joi.string().email(),
  aboutTitle: Joi.string().allow(""),
  des: Joi.string().allow(""),
  address: Joi.string().allow(""),
  ProfileVisible: Joi.string().required().valid("1", "0"),
  logoVisible: Joi.string().required().valid("1", "0"),
  aboutVisible: Joi.string().required().valid("1", "0"),
  contactVisible: Joi.string().required().valid("1", "0"),
  template: Joi.string().allow(""),
  profileFile: Joi.binary().encoding("base64").allow(""),
  logoFile: Joi.binary().encoding("base64").allow(""),
  showName: Joi.string().allow(""),
  showTitle: Joi.string().allow(""),
  showLogo: Joi.string().allow(""),
  showProfile: Joi.string().allow(""),
  profile: Joi.string().allow(""),
  logo: Joi.string().allow(""),
});

const app = express();
app.use(cors());
app.use(bodyParser.json({ limit: "10mb" }));
app.use("/uploads", express.static("uploads"));

app.get("/people/:id", async (req, res) => {
  const id = req.params.id;
  try {
    const [rows] = await pool.query("SELECT * FROM people WHERE id = ?", [id]);
    const person = rows[0];
    if (person) {
      res.json(person);
    } else {
      res.status(404).json({ message: "Person not found" });
    }
  } catch (error) {
    handleError(error, res);
  }
});

app.post(
  "/people",
  upload.fields([
    { name: "logoFile", maxCount: 1 },
    { name: "profileFile", maxCount: 1 },
  ]),
  async (req, res) => {
    // console.log(req.body);
    // console.log(req.files);
    const { error } = schema.validate(req.body);
    const { name, ...rest } = req.body;

    let profileFile = null;
    let logoFile = null;

    if (error) {
      return res.status(400).json({ message: error.details[0].message });
    } else {
    }

    if (req.files.profileFile && req.files.profileFile[0].filename) {
      profileFile = `/uploads/${req.files.profileFile[0].filename}`;
    }

    if (req.files.logoFile && req.files.logoFile[0].filename) {
      logoFile = `/uploads/${req.files.logoFile[0].filename}`;
    }

    try {
      const [result] = await pool.query("INSERT INTO people SET ?", {
        name,
        ...rest,
        logoFile,
        profileFile,
      });
      res.json({ message: "Person created successfully", id: result.insertId });
    } catch (error) {
      console.log(error);
    }
  }
);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: "Internal server error" });
});

app.listen(process.env.PORT, () => {
  console.log("Back deploy On port " + process.env.PORT);
});
