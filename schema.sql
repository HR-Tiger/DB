DROP DATABASE IF EXISTS coffee_shop_db;

CREATE DATABASE coffee_shop_db;

\c coffee_shop_db;

CREATE TABLE users (
  user_id serial PRIMARY KEY,
  password VARCHAR(30) NOT NULL,
  profile_photo_url TEXT,
  email VARCHAR(50) NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  address VARCHAR(80),
  city VARCHAR(80),
  state VARCHAR(4),
  zip INT
);

CREATE TABLE shops (
  shop_id serial PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  address VARCHAR(80) NOT NULL,
  city VARCHAR(80) NOT NULL,
  state VARCHAR(4) NOT NULL,
  zip INT NOT NULL,
  date timestamp,
  phone_number TEXT,
  website TEXT,
  animal_friendly boolean
);

CREATE TABLE reviews (
  review_id serial PRIMARY KEY,
  user_id INT NOT NULL,
  shop_id INT NOT NULL,
  summary VARCHAR(50) NOT NULL,
  category VARCHAR(30) NOT NULL,
  description TEXT NOT NULL,
  rating INT,
  owner_response TEXT,
  date timestamp,
  helpfulnessCount INT DEFAULT 0,

  CONSTRAINT fk_user
    FOREIGN KEY(user_id)
      REFERENCES users(user_id),

  CONSTRAINT fk_shop
    FOREIGN KEY(shop_id)
      REFERENCES shops(shop_id)
);

CREATE TABLE shops_photos (
  photo_id serial PRIMARY KEY,
  shop_id INT NOT NULL,
  url TEXT,
  CONSTRAINT fk_shop
    FOREIGN KEY(shop_id)
      REFERENCES shops(shop_id)
);

CREATE TABLE reviews_photos (
  photo_id serial PRIMARY KEY,
  review_id INT NOT NULL,
  url TEXT,

  CONSTRAINT fk_review
    FOREIGN KEY(review_id)
      REFERENCES reviews(review_id)
);

-- CREATE INDEXES
CREATE INDEX reviews_user_id_index ON reviews(user_id);
CREATE INDEX reviews_shop_id_index ON reviews(shop_id);
CREATE INDEX shops_photos_shop_id_index ON shops_photos(shop_id);
CREATE INDEX reviews_photos_review_id_index ON reviews_photos(review_id);

-- INSERT INTO DB