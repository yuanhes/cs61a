CREATE TABLE original AS
    SELECT 1 AS n, "It's" AS word UNION
    SELECT 2, "The" UNION
    SELECT 3 , "End";
 
CREATE TABLE code AS
    SELECT "Up" AS x, "Down" AS y UNION
    SELECT "Now", "Home" UNION
    SELECT "It's" , "What" UNION
    SELECT "See", "Do" UNION
    SELECT "Can", "See" UNION
    SELECT "End", "Now" UNION
    SELECT "What" , "You" UNION
    SELECT "The", "Happens" UNION
    SELECT "Love" , "Scheme" UNION
    SELECT "Not", "Mess" UNION
    SELECT "Happens", "Go";

-- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
CREATE TABLE encrypted AS
    SELECT n, y AS word
    FROM original, code
    WHERE word = x
    ORDER BY n
;

-- SELECT  "REPLACE THIS LINE WITH YOUR SOLUTION";
CREATE TABLE decoded AS
    SELECT n, y AS word
    FROM encrypted, code
    WHERE word = x
    ORDER BY n
;

-- Join original with code AS a and code AS b to create six-column rows like: 2|The|The|Happens|Happens|Go
CREATE TABLE six_col AS
    SELECT n, word, a.x, a.y, b.x, b.y
    FROM original, code AS a, code AS b
    WHERE word = a.x and a.y = b.x
    ORDER BY n
;
