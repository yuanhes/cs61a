CREATE TABLE pizzas AS
  SELECT "Artichoke" AS name, 12 AS open, 15 AS close UNION
  SELECT "La Val's"         , 11        , 22          UNION
  SELECT "Sliver"           , 11        , 20          UNION
  SELECT "Cheeseboard"      , 16        , 23          UNION
  SELECT "Emilia's"         , 13        , 18;

CREATE TABLE meals AS
  SELECT "breakfast" AS meal, 11 AS time UNION
  SELECT "lunch"            , 13         UNION
  SELECT "dinner"           , 19         UNION
  SELECT "snack"            , 22;

-- Pizza places that open before 1pm in alphabetical order
-- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
CREATE TABLE open_early AS
  SELECT name
    FROM pizzas
    WHERE open < 13
    ORDER BY name DESC
;

-- Pizza places and the duration of a study break that ends at 14 o'clock
-- SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
CREATE TABLE study_session AS
  SELECT name, MAX(14 - open, 0) AS duration
    FROM pizzas
    ORDER BY duration DESC
;

-- Pizza places that are open for late-night-snack time and when they close
CREATE TABLE late_night_snack AS
  SELECT name || " closes at " || close AS status
    FROM pizzas, meals
    WHERE meal = "snack" and close >= time
;

-- Two meals at the same place
CREATE TABLE double_pizza AS
  SELECT a.meal AS first, b.meal AS second, name
    FROM meals AS a, meals AS b, pizzas
    WHERE a.time >= open and b.time <= close and (b.time - a.time) > 6
;
