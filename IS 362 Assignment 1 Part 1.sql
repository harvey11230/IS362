-- 1.How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed?
SELECT COUNT(tailnum), MAX(speed) as Maximum_Speed, min(speed) as Minimum_Speed 
FROM planes
WHERE speed IS NOT NULL;
-- A:There are 23 airpalnes have liseted speed. The maximum listed speed is 432 and the minimum listed speed is 90.

-- 2. What is the total distance flown by all of the planes in January 2013? What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT year, SUM(distance)
FROM flights
WHERE month = 1;

-- A:The total distance flown for all planes in January 2013 is 27188805.

SELECT SUM(distance) 
FROM flights
WHERE month = 1 AND tailnum IS NULL;

-- A:The total distance flown by all of the planes in January 2013 where the tailnum is missing is 0.

-- 3.What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
SELECT planes.manufacturer, SUM(distance)
FROM flights
INNER JOIN planes on flights.tailnum = planes.tailnum
WHERE month = 7 and day = 5 and flights.year = 2013
GROUP BY manufacturer;

-- A: Inner Join will show records from both tables that satisfy the given condition.
-- In this case, Left Join will show records from both tables even manufacturer is null.
-- Outer Join will only show the null records of join tables.

-- 4.Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
SELECT name
FROM airlines as a
INNER JOIN flights as f ON a.carrier = f.carrier
INNER JOIN planes as p ON p.tailnum = f.tailnum
WHERE p.manufacturer = 'EMBRAER'
GROUP BY name;

-- Above query will be able to display what companies bought Embraer's airplane.
-- The result will show ExpressJet Ailines Inc, JetBlue Airways, and US Airways Inc.


