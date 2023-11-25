\c penpal_dev;

INSERT INTO users (first_name, last_name, email, phone, dob, password_hash, created_date) VALUES
( 'Adam', 'Andrews', 'adam@gmail.com', '212-212-2120', to_date('10/23/1974','MM/DD/YYYY HH24:MI'), 'abc123', CURRENT_TIMESTAMP ),
( 'Benjamin', 'Bratt', 'bbratt@gmail.com', '212-212-2121', to_date('09/27/1998','MM/DD/YYYY HH24:MI'), 'abc132', CURRENT_TIMESTAMP ),
( 'Charles', 'Chaplain', 'charles@gmail.com', '212-212-2122', to_date('07/18/1996','MM/DD/YYYY HH24:MI'), 'abc312', CURRENT_TIMESTAMP ),
( 'David', 'Daniels', 'david@gmail.com', '212-212-2122', to_date('09/18/1996','MM/DD/YYYY HH24:MI'), 'abc312', CURRENT_TIMESTAMP ),
( 'Edward', 'Everett', 'edwardE@gmail.com', '212-212-2122', to_date('01/29/1996','MM/DD/YYYY HH24:MI'), 'abc312', CURRENT_TIMESTAMP ),
( 'Fred', 'Feldman', 'fred@gmail.com', '212-212-2123', to_date('12/02/1995','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );
( 'Greg', 'Gerard', 'greg@gmail.com', '212-212-2123', to_date('10/2/1984','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );
( 'Harry', 'Houdini', 'harry@gmail.com', '212-212-2123', to_date('01/14/1973','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );
( 'Izzy', 'Imani', 'harry@gmail.com', '212-212-2123', to_date('03/04/1987','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );
( 'John', 'Jameson', 'harry@gmail.com', '212-212-2123', to_date('12/02/1987','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );
( 'Karen', 'Kowalski', 'harry@gmail.com', '212-212-2123', to_date('07/05/1994','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );
( 'Les', 'Lawrence', 'harry@gmail.com', '212-212-2123', to_date('10/02/1988','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );
( 'Mary', 'Monina', 'harry@gmail.com', '212-212-2123', to_date('09/02/2001','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );
( 'Nora', 'Nilland', 'harry@gmail.com', '212-212-2123', to_date('07/09/1984','MM/DD/YYYY HH24:MI'), 'abc213', CURRENT_TIMESTAMP );

INSERT INTO membership (user_id, tier, duration, cost, create_date, start_date, end_date ) VALUES
( '1', 'ionian', NULL, '0.00', CURRENT_TIMESTAMP, '11/24/2023', NULL ),
( '2', 'ionian', NULL, '0.00', CURRENT_TIMESTAMP, '11/24/2023', NULL ),
( '3', 'dorian', 30, '14.99', CURRENT_TIMESTAMP, '11/24/2023', '02/24/2024' )
( '4', 'phrygian', 60, '28.99', CURRENT_TIMESTAMP, '11/24/2023', '05/24/2024'),
( '5', 'dorian', 30, '14.99', CURRENT_TIMESTAMP, '11/24/2023', '02/24/2024' ),
( '6', 'ionian', NULL, '0.00', CURRENT_TIMESTAMP, '11/24/2023', NULL );

INSERT INTO subscription_plans (ionian, dorian, phrygian, lydian, mixolydian, start_date, rate_active ) VALUES
( ['0.00', NULL], ['14.99', 30], ['28.99', 60], ['41.99', 90], ['69.99', 180] CURRENT_TIMESTAMP, true );

INSERT INTO profiles (user_id, gender, age, city, state, country, body_type, height, eyes, hair, ethnicity, smoking, drinking, living_situation, tv_watching, religion, marital_status, have_kids, wants_kids, education, employment_status, occupation, sense_of_humor, interest, phone, headline, about_me, looking_for, start_date ) VALUES
( 1,'Woman', 23, 'Cebu','Central Visayas','Phillippines','Slim',{`5'`,`7"`},'Brown','Black','Asian','No', 'Sometimes','Alone',{'Drama','Comedy','SciFi', 'True Crime'}, 'Christian','Single', 'No', 'Yes', 'Some College', 'Employed','Sales Associate','Funny', {'Computers','Dancing','Cooking','Talkkng','Walking'},'123-456-7890','Looking for Great PenPal!','Caring woman, enjoys getting to know people. I enjoy a siimple life.', 'Looking for a penpal',CURRENT_TIMESTAMP);

INSERT INTO other_characteristics (user_id, profiles_id, songs, movies, instruments_i_play, sports_i_watch, sports_i_play, vacation_spots, foods, create_date ) VALUES
( 1, 1, {'A Day in the Life', 'Blackbird', 'Fool In the Rain', 'Landslide'}, {'the Matrix', 'Out Of Africa','Avatar'},{'Guitar'},{'Gymnastics','Figure Skating'},{'Bicycling', 'Dancing', 'Roller Skating'}, {'Mohonk Country Estates', 'Mogo New South Whales, AUS'},{'Sushi','Chinese', 'Jamaican', 'Indian'}, CURRENT_TIMESTAMP  );

INSERT INTO friends (user_id, friend_id, create_date) VALUES 
(1, 3, CURRENT_TIMESTAMP),
(1, 3, CURRENT_TIMESTAMP),
(1, 3, CURRENT_TIMESTAMP);

INSERT INTO friend_likes (user_id, friend_id, like_icon, create_date) VALUES (

);


-- CREATE TABLE friends (
--   id SERIAL PRIMARY KEY,
--   user_id INTEGER,
--   friend_id INTEGER,
--   created_date TIMESTAMP DEFAULT NOW()
-- );

-- DROP TABLE IF EXISTS friend_likes;
-- CREATE TABLE friend_likes (
--   id SERIAL PRIMARY KEY,
--   user_id INTEGER,
--   friend_id INTEGER,
--   like_icon TEXT, -- :smiley, :heart, :double_heart, :thumbs_up, :hands_clapping
--   created_date TIMESTAMP DEFAULT NOW()
-- );