const db = require('../db/dbConfig.js'); 

const getAllUsers = async () => {
  try {
    const users = await db.any('SELECT * FROM users');
    return users;
  } catch (error) {
    throw error;
  }
};
const getUserById = async (userId) => {
  try {
    const user = await db.any('SELECT * FROM users WHERE id = $1', userId);
    return user;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  getAllUsers,
  getUserById,
//   createUser,
//   updateUser,
//   deleteUser,
};