DROP DATABASE IF EXISTS penpal_dev;
CREATE DATABASE penpal_dev;

\c penpal_dev;


-- USER TABLES
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone VARCHAR(15),
  dob TEXT,
  password_hash TEXT,
  create_date TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS membership;

CREATE TABLE membership (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  tier TEXT,
  duration INTEGER,
  cost TEXT,
  created_date TIMESTAMP DEFAULT NOW(),
  start_date DATE(),
  end_date DATE()
);

DROP TABLE IF EXISTS subscription_plans;

CREATE TABLE subscription_plans (
  id SERIAL PRIMARY KEY,
  ionian TEXT[],
  dorian TEXT[],
  phrygian TEXT[],
  lydian TEXT[],
  mixolydian TEXT[],
  created_date TIMESTAMP DEFAULT NOW(),
  acive BOOLEAN
);

DROP TABLE IF EXISTS profiles;

CREATE TABLE profiles (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  gender VARCHAR(6),
  age INTEGER, -- Calculated from DOB in users table
  -- Location
  city TEXT,
  state TEXT,
  country TEXT,
  -- Appearance
  body_type TEXT, -- Slim, Thin, Average, Fit, Athletic, Large, A few extra pounds
  height TEXT[], -- 5', 10" [ feet, inches ]
  eyes TEXT,
  hair TEXT,
  ethnicity TEXT,
  -- Lifestyle
  smoking TEXT[],
  drinking TEXT[],
  living_situation TEXT,
  tv_watching TEXT,
  religion TEXT,
  -- Home and Family
  marital_status TEXT,
  have_kids VARCHAR(3),
  wants_kids VARCHAR(3),
  -- Professional Life
  education TEXT,
  employment_status TEXT,
  occupation TEXT,
  -- Personal
  sense_of_humor TEXT,
  interest TEXT,
  phone TEXT,
  headline TEXT,
  about_me TEXT,
  looking_for TEXT,
);

DROP TABLE IF EXISTS other_characteristics; 
  -- Other Characteristics - favorites activities
CREATE TABLE other_characteristics (
  songs TEXT[],
  movies TEXT[],
  instruments_i_play TEXT[],
  sports_i_watch TEXT[],
  sports_i_play TEXT[],
  vacation_spots TEXT[],
  foods TEXT[],
  created_date TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS friends;
CREATE TABLE friends (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  friend_id INTEGER,
  create_date TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS friend_likes;
CREATE TABLE friend_likes (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  friend_id INTEGER,
  like_icon TEXT, -- :smiley, :heart, :double_heart, :thumbs_up, :hands_clapping
  create_date TIMESTAMP DEFAULT NOW()
);

-- MESSAGES - are addressed one-on-one from a sender to recipient
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  parent_id INTEGER,
  sender_id INTEGER,
  recipient_id INTEGER,
  body INTEGER,
  date_sent TIMESTAMP DEFAULT NOW(),
  msg_read BOOLEAN
);

-- BLOGS -  blog posts are posted in a blog forum
DROP TABLE IF EXISTS blogs;
CREATE TABLE blogs (
  id SERIAL PRIMARY KEY,
  parent_id INTEGER, -- Comments have parent ids
  topic TEXT,
  body INTEGER,
  user_id INTEGER,
  date_created TIMESTAMP DEFAULT NOW() 
);

DROP TABLE IF EXISTS blog_likes;
CREATE TABLE blogs (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  blog_id INTEGER,
  like_icon TEXT, -- :smiley, :heart, :double_heart, :thumbs_up, :hands_clapping
  date_created TIMESTAMP DEFAULT NOW() 
);

-- PHOTO ALBUMS -  
DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  album_name TEXT,
  photo_url TEXT,
  photo_description TEXT,
  date_created TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS photo_likes;
CREATE TABLE photo_likes (
  id SERIAL PRIMARY KEY,
  photo_id INTEGER,
  like_icon TEXT, -- :smiley, :heart, :double_heart, :thumbs_up, :hands_clapping
  date_created TIMESTAMP DEFAULT NOW() 
);

-- CHAT ROOMS - the rooms are persistent...however posts disappear as soon as everyone leaves a room
-- posts are handled as a hash in a REACT Component
DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms (
  id SERIAL PRIMARY KEY,
  category TEXT,
  room_name TEXT,
  room_description TEXT,
  date_created TIMESTAMP DEFAULT NOW()
);

-- PRODUCTS TABLE - Stores products for viewing
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  product_url TEXT,
  product_description TEXT,
  sales_start DATE(),
  sales_end DATE(),
  volume_on_hand INTEGER,
  volume_sold INTEGER,
  cost DECIMAL,
  price DECIMAL,
  affiliate_fee DECIMAL,
  time_created TIMESTAMP DEFAULT NOW()
);

-- PRODUCT IMAGES 
DROP TABLE IF EXISTS product_imgs;
CREATE TABLE product_imgs (
  id SERIAL PRIMARY KEY,
  img TEXT,
  products.id INTEGER
);
DROP TABLE IF EXISTS product_likes;
CREATE TABLE product_likes (
  id SERIAL PRIMARY KEY,
  products.id,
  user_id INTEGER,
  like_icon TEXT
);

DROP TABLE IF EXISTS product_favorites;
CREATE TABLE product_favorites (
  id SERIAL PRIMARY KEY,
  products.id, -- FKey
  user_id INTEGER, --FKey
  favorite BOOLEAN
);