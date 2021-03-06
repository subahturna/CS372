CREATE TABLE Users (
	uid INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(64) NOT NULL,
	email VARCHAR (255) NOT NULL,
	password VARCHAR(24) NOT NULL,
	DOB DATE NOT NULL,
    location VARCHAR(50) NOT NULL,
	avatar VARCHAR (255) NOT NULL,
	PRIMARY KEY (uid)
) engine = "innoDB";

CREATE TABLE Books(

    isbn_10 INT NOT NULL,
    isbn_13 INT NOT NULL,    
    name VARCHAR(64) NOT NULL,
    author VARCHAR(64) NOT NULL,
    publisher VARCHAR(64) NOT NULL,
    description VARCHAR(1024) NOT NULL,
    image VARCHAR(256) NOT NULL,
    price DECIMAL(6,2),
    PRIMARY KEY(isbn_13)

) engine = "innoDB";

CREATE TABLE Listings(

	lid INT NOT NULL AUTO_INCREMENT,
    isbn_10 INT NOT NULL,
    isbn_13 INT NOT NULL,
    uid INT NOT NULL,   
    book_condition VARCHAR(20) NOT NULL,
    image VARCHAR(256) NOT NULL,
    price DECIMAL(6,2),
	list_date DATE NOT NULL,
    PRIMARY KEY(lid)

) engine = "innoDB";

CREATE TABLE Chats(

    cid INT NOT NULL AUTO_INCREMENT,
    lid INT NOT NULL,
    uid_buyer INT NOT NULL,
	chat_open DATETIME NOT NULL,
    PRIMARY KEY(cid),
    FOREIGN KEY(lid) REFERENCES Listings(lid),
    FOREIGN KEY(uid_buyer) REFERENCES Users(uid)

) engine = "innoDB";

CREATE TABLE Messages(

    mid INT NOT NULL AUTO_INCREMENT,
    uid_sender INT NOT NULL,
    cid INT NOT NULL,
    message VARCHAR (2056),
	time_sent DATETIME NOT NULL,
    PRIMARY KEY(mid),
    FOREIGN KEY(cid) REFERENCES Chats(cid),
    FOREIGN KEY(uid_sender) REFERENCES Users(uid)

) engine = "innoDB";