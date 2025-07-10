CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  --SELECT a.name
    --FROM dogs AS a, dogs AS b, parents
    --WHERE a.name = parents.child and b.name = parents.parent
    --ORDER BY b.height DESC
  SELECT child
    FROM dogs, parents
    WHERE name = parent
    ORDER BY height DESC
;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  SELECT name, size
    FROM dogs, sizes
    WHERE height > min and height <= max
;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  -- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  SELECT a.child AS aname, b.child AS bname, sizea.size AS size
    FROM parents AS a, parents AS b, size_of_dogs AS sizea, size_of_dogs AS sizeb
    WHERE a.child = sizea.name and b.child = sizeb.name and a.parent = b.parent and a.child < b.child and sizea.size = sizeb.size
;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  --SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  SELECT CONCAT("The two siblings, ", s.aname, " and ", s.bname, ", have the same size: ", s.size)
    FROM siblings AS s
;

-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  --SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
  SELECT fur, MAX(height) - MIN(height)
    FROM dogs
    GROUP BY fur
    HAVING MAX(height)/AVG(height) < 1.3 AND MIN(height)/AVG(height) > 0.7
;

