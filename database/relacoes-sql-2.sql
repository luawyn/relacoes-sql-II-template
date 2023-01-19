-- Active: 1673990531769@@127.0.0.1@3306

-- Práticas

CREATE TABLE users (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL, 
  email TEXT UNIQUE NOT NULL, 
  password TEXT NOT NULL, 
  create_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES
("u001", "Adolfo", "adolfo@email.com", "1234"),
("u002", "Medeiros", "medeiros@email.com", "5678"),
("u003", "Maura", "maura@email.com", "91011");


CREATE TABLE follows (
  follower_id TEXT NOT NULL,
  followed_id TEXT NOT NULL,
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO follows(follower_id, followed_id)
VALUES 
("u001", "u002"),
("u001", "u003"),
("u002", "u001");

SELECT * FROM users
INNER JOIN follows
ON follows.follower_id = users.id;

SELECT * FROM users
LEFT JOIN follows
ON follows.follower_id = users.id;

SELECT 
users.id AS usersId,
users.name,
follows.followed_id AS followerId,
follows.follower_id AS followedId,
usersFollowed.name AS nameFollowed
 FROM users
LEFT JOIN follows
ON follows.follower_id = users.id
INNER JOIN users AS usersFollowed
ON follows.followed_id = usersFollowed.id
