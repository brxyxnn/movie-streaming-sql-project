-- 1. Top 10 Highest Rated Movies (with Average User Scores)--
SELECT m.Title, ROUND(AVG(r.Score), 2) AS AvgUserRating
FROM movie m
JOIN rating r ON m.MovieID = r.MovieID
GROUP BY m.MovieID
ORDER BY AvgUserRating DESC
LIMIT 10;

-- 2.  Most Watched Movies by Number of Views --
SELECT m.Title, COUNT(w.UserID) AS Views
FROM movie m
JOIN watchhistory w ON m.MovieID = w.MovieID
GROUP BY m.MovieID
ORDER BY Views DESC
LIMIT 10;

-- 3. Most Popular Genres by Watch Count --
SELECT g.GenreName, COUNT(*) AS WatchCount
FROM genre g
JOIN movie_genres mg ON g.GenreID = mg.GenreID
JOIN watchhistory w ON mg.MovieID = w.MovieID
GROUP BY g.GenreID
ORDER BY WatchCount DESC;

-- 4. Top 5 Actors Who Starred in the Most Movies --
SELECT a.ActorName, COUNT(ma.MovieID) AS MovieCount
FROM actor a
JOIN movie_actor ma ON a.ActorID = ma.ActorID
GROUP BY a.ActorID
ORDER BY MovieCount DESC
LIMIT 5;

-- 5. User Watch Habits: Most Active Viewers -- 
SELECT u.Username, COUNT(w.MovieID) AS MoviesWatched
FROM user u
JOIN watchhistory w ON u.UserID = w.UserID
GROUP BY u.UserID
ORDER BY MoviesWatched DESC
LIMIT 5;