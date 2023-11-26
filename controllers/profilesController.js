const express = require('express');
const router = express.Router();

const {
  getAllProfiles,
  getProfileByPw,
  // createProfile,
} = require('../queries/profileQueries'); 

router.get('/', async (req, res) => {

  const profile = await getAllProfiles();

  if (!Array.isArray(profile)) {
    return res.status(500).json({ error: 'Server Error. Please Try Again.' });
  } else {
    return res.json(profile);
  }
});

router.get('/:password_hash', async (req, res) => {
  const pwHash = req.params.password_hash
  const profile = await getProfileByPw(pwHash);

  if (!Array.isArray(profile)) {
    return res.status(500).json({ error: 'Server Error. Please Try Again.' });
  } else {
    return res.json(profile);
  }
});

module.exports = router;