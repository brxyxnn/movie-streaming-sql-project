-- Create_Database_Team7.sql
CREATE DATABASE IF NOT EXISTS moviestreamingdb;
USE moviestreamingdb;

CREATE TABLE Genre (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL
);

CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Duration INT,
    Rating FLOAT,
    Description TEXT,
    ReleaseYear YEAR
);

CREATE TABLE Movie_Genres (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

CREATE TABLE Actor (
    ActorID INT PRIMARY KEY,
    ActorName VARCHAR(100) NOT NULL
);

CREATE TABLE Movie_Actor (
    MovieID INT,
    ActorID INT,
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    CreatedAt DATE
);

CREATE TABLE Rating (
    RatingID INT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Score FLOAT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE WatchHistory (
    HistoryID INT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);
