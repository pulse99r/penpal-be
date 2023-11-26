const db = require('../db/dbConfig.js'); 

const getAllProfiles = async () => {
  try {
    const profiles = await db.any('SELECT * FROM users LEFT JOIN profiles ON users.id = profiles.user_id');
    return profiles;
  } catch (error) {
    throw error;
  }
};
const getProfileByPw = async (pwHash) => {
  try {
    const profile = await db.any('SELECT * FROM users JOIN profiles ON users.id = profiles.user_id WHERE users.password_hash = $1 ', pwHash);
    return profile;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  getAllProfiles,
  getProfileByPw,
//   createUser,
//   updateUser,
//   deleteUser,
};