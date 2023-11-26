DROP DATABASE IF EXISTS penpal_dev;
CREATE DATABASE penpal_dev;

\c penpal_dev;


DROP TABLE IF EXISTS users;  --  1
DROP TABLE IF EXISTS membership; -- 2
DROP TABLE IF EXISTS subscription_plans; -- 3
DROP TABLE IF EXISTS profiles; -- 4
DROP TABLE IF EXISTS other_characteristics; -- 5 
DROP TABLE IF EXISTS friend_requests; -- 6
DROP TABLE IF EXISTS friend_likes; -- 7
DROP TABLE IF EXISTS messages; -- 8
DROP TABLE IF EXISTS blogs; --9
DROP TABLE IF EXISTS blog_likes; -- 10
DROP TABLE IF EXISTS photos; -- 11
DROP TABLE IF EXISTS photo_likes; -- 12
DROP TABLE IF EXISTS rooms; -- 13
DROP TABLE IF EXISTS products; -- 14
DROP TABLE IF EXISTS product_imgs; -- 15
DROP TABLE IF EXISTS product_likes; -- 16
DROP TABLE IF EXISTS product_favorites; -- 17




-- USER TABLES

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

CREATE TABLE membership (
  id SERIAL PRIMARY KEY,
  user_id INT,
  tier TEXT,
  duration INT,
  cost TEXT,
  create_date TIMESTAMP DEFAULT NOW(),
  start_date DATE,
  end_date DATE
);

CREATE TABLE subscription_plans (
  id SERIAL PRIMARY KEY,
  intro_level VARCHAR[],
  dorian VARCHAR[],
  phrygian VARCHAR[],
  lydian VARCHAR[],
  ionian VARCHAR[],
  create_date TIMESTAMP DEFAULT NOW(),
  rate_active BOOLEAN
);

CREATE TABLE profiles (
  id SERIAL PRIMARY KEY,
  user_id INT,
  gender VARCHAR(6),
  age INT, -- Calculated from DOB in users table
  -- Location
  city TEXT,
  state TEXT,
  country TEXT,
  -- Appearance
  body_type TEXT, 
  -- body)type: Slim, Thin, Average, Fit, Athletic, Large, A few extra pounds
  height TEXT[], -- 5', 10" [ feet, inches ]
  eyes TEXT,
  hair TEXT,
  ethnicity TEXT,
  -- Lifestyle
  smoking TEXT,
  drinking TEXT,
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
  create_date TIMESTAMP DEFAULT NOW()
);

-- Other Characteristics - favorites activities
CREATE TABLE other_characteristics (
  user_id INT, 
  profiles_id INT,
  songs TEXT[],
  movies TEXT[],
  instruments_i_play TEXT[],
  sports_i_watch TEXT[],
  sports_i_play TEXT[],
  vacation_spots TEXT[],
  foods TEXT[],
  create_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE friend_requests (
  id SERIAL PRIMARY KEY,
  sender_id INT,
  recipient_id INT,
  request_status TEXT, -- Sent, Accepted, Denied
  create_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE friend_likes (
  id SERIAL PRIMARY KEY,
  user_id INT,
  friend_id INT,
  request_status TEXT,
  like_icon TEXT, -- :smiley, :heart, :double_heart, :thumbs_up, :hands_clapping
  create_date TIMESTAMP DEFAULT NOW()
);

-- MESSAGES - are addressed one-on-one from a sender to recipient
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  parent_id INT,
  sender_id INT,
  recipient_id INT[],
  body VARCHAR(300),
  create_date TIMESTAMP DEFAULT NOW(),
  msg_read BOOLEAN
);

-- BLOGS -  blog posts are posted in a blog forum
CREATE TABLE blogs (
  id SERIAL PRIMARY KEY,
  parent_id INT, -- Comments have parent ids
  topic TEXT,
  body TEXT,
  user_id INT,
  date_created TIMESTAMP DEFAULT NOW() 
);

CREATE TABLE blog_likes (
  id SERIAL PRIMARY KEY,
  user_id INT,
  blog_id INT,
  like_icon TEXT, 
  -- like_icons are :smiley, :heart, :double_heart, :thumbs_up, :hands_clapping
  date_created TIMESTAMP DEFAULT NOW() 
);

-- PHOTO ALBUMS -  
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  user_id INT,
  album_name TEXT,
  photo_url TEXT,
  photo_description TEXT,
  date_created TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_likes (
  id SERIAL PRIMARY KEY,
  photo_id INT,
  like_icon TEXT, 
  -- like_icons are :smiley, :heart, :double_heart, :thumbs_up, :hands_clapping
  date_created TIMESTAMP DEFAULT NOW() 
);

-- CHAT ROOMS - the rooms are persistent...however posts disappear as soon as everyone leaves a room
-- posts are handled as a hash in a REACT Component
CREATE TABLE rooms (
  id SERIAL PRIMARY KEY,
  category TEXT,
  room_name TEXT,
  room_description TEXT,
  date_created TIMESTAMP DEFAULT NOW()
);

-- PRODUCTS TABLE - Stores products for viewing
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  product_url TEXT,
  product_description TEXT,
  sales_start DATE,
  sales_end DATE,
  volume_on_hand INT,
  volume_sold INT,
  cost DECIMAL,
  price DECIMAL,
  affiliate_fee DECIMAL,
  time_created TIMESTAMP DEFAULT NOW()
);

-- PRODUCT IMAGES 
CREATE TABLE product_imgs (
  id SERIAL PRIMARY KEY,
  img TEXT,
  products_id INT
);

CREATE TABLE product_likes (
  id SERIAL PRIMARY KEY,
  products_id INT,
  user_id INT,
  like_icon TEXT
);

CREATE TABLE product_favorites (
  id SERIAL PRIMARY KEY,
  products_id INT, -- FKey
  user_id INT, --FKey
  favorite BOOLEAN
);