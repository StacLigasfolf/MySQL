DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  email VARCHAR(120) UNIQUE,
  phone BIGINT UNSIGNED UNIQUE,
  password_hash VARCHAR(100),

  INDEX user_firstname_lastname_idx (firstname, lastname)
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles  (
  user_id BIGINT UNSIGNED NOT NULL,
  gender CHAR(1),
  birthday DATE,
  photo_id BIGINT UNSIGNED,
  create_at DATE DEFAULT (now()),
  hometown VARCHAR(100),

  FOREIGN KEY (user_id) references users(id) ON UPDATE CASCADE ON DELETE RESTRICT
);


DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id SERIAL,
  from_user_id BIGINT UNSIGNED NOT NULL,
  to_user_id BIGINT UNSIGNED NOT NULL,
  body TEXT,
  create_at DATETIME DEFAULT (NOW()),
  FOREIGN KEY (from_user_id) references users(id),
  FOREIGN KEY (to_user_id) references users(id)
);

DROP TABLE IF EXISTS frends_requests;
CREATE TABLE frends_requests (
  initiator_user_id BIGINT UNSIGNED NOT NULL,
  target_user_id BIGINT UNSIGNED NOT NULL,
  `status` ENUM ('requested', 'approved', 'declined', 'unfriended'),
  requested_at DATETIME DEFAULT (NOW()),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (initiator_user_id, target_user_id),
  FOREIGN KEY (initiator_user_id) REFERENCES users(id),
  FOREIGN KEY (target_user_id) REFERENCES users(id),
  CHECK (initiator_user_id <> target_user_id)
);

DROP TABLE IF EXISTS communities;
CREATE TABLE communities (
  id SERIAL,
  name VARCHAR(150),
  admin_user_id BIGINT UNSIGNED NOT NULL,
  
  INDEX community_name_idx(name),
  FOREIGN KEY (admin_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS user_communities;
CREATE TABLE user_communities (
  user_id BIGINT UNSIGNED NOT NULL,
  community_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (user_id, community_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (community_id) REFERENCES communities(id)
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
  id SERIAL,
  namme VARCHAR(255),
  created_at DATETIME DEFAULT (NOW()),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS media;
CREATE TABLE media (
  id SERIAL,
  media_type_id BIGINT UNSIGNED NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL,
  body TEXT,
  filename VARCHAR(255),
  `size` INT,
  metadata JSON,
  created_at DATETIME DEFAULT (NOW()),
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id SERIAL,
  user_id BIGINT UNSIGNED NOT NULL,
  media_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT (NOW()),

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS photo_albums;
CREATE TABLE photo_albums (
  id SERIAL, 
  name VARCHAR(100),
  user_id BIGINT UNSIGNED NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  album_id BIGINT UNSIGNED NOT NULL,
  media_id BIGINT UNSIGNED NOT NULL,
  FOREIGN KEY (album_id) REFERENCES photo_albums(id),
  FOREIGN KEY (media_id) REFERENCES media(id)
);

-- Домашнее задание начинается здесь

DROP TABLE IF EXISTS Posts;
create table Posts ( 
		id int primary key,
		post varchar(100),
		profiles BIGINT UNSIGNED NOT null,
		
		FOREIGN KEY (profiles) REFERENCES profiles(user_id)
);
 
DROP TABLE IF EXISTS Comments;
create table Comments (
		id int,
		comment varchar(100),
 		posts_id INT,
 		
		FOREIGN KEY (posts_id) REFERENCES Posts(id)
);

drop table if exists Reposts;
create table Reposts (
	id int,
	posts_id INT,
	FOREIGN KEY (posts_id) REFERENCES Posts(id)

);




