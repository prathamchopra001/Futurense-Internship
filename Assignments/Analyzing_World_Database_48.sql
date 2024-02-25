USE world;
DESCRIBE country;

SELECT * FROM country;

DESCRIBE city;

SELECT * FROM city;
DESCRIBE countrylanguage;

SELECT * FROM countrylanguage;



SELECT
    Name AS country_name,
    Population
FROM
    country
WHERE
    Continent = 'Europe' AND Population > 50000000;




SELECT
    Name AS city_name,
    CountryCode
FROM
    city
WHERE
    CountryCode IN ('BRA', 'ARG');






SELECT
    Name AS country_name,
    Continent
FROM
    country
WHERE
    Continent IN ('Americas', 'Asia');




SELECT
    Name AS country_name,
    Population
FROM
    country
WHERE
    Population BETWEEN 10000000 AND 50000000;




SELECT
    Name AS city_name,
    CountryCode
FROM
    city
WHERE
    Name LIKE 'San%';




SELECT
    Name AS city_name,
    Population
FROM
    city
ORDER BY
    Population DESC
LIMIT 10;



SELECT
    Name AS country_name,
    HeadOfState
FROM
    country
WHERE
    HeadOfState IS NULL;



SELECT DISTINCT
    Continent
FROM
    country;


