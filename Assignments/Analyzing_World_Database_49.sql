SELECT
    Name,
    Continent,
    Population
FROM
    country;


SELECT
    c.Name AS 'Country Name',
    c.Continent,
    c.Population
FROM
    country c;


SELECT
    Name,
    Population
FROM
    country
WHERE
    Continent = 'Europe' AND Population > 10000000;


SELECT
    Name AS city_name,
    CountryCode
FROM
    city
WHERE
    CountryCode IN ('POL', 'BEL');


SELECT
    Name AS country_name,
    LifeExpectancy
FROM
    country
WHERE
    Continent = 'South America'
ORDER BY
    LifeExpectancy DESC;


SELECT
    Name AS city_name,
    Population
FROM
    city
ORDER BY
    Population DESC
LIMIT 5;


-- Additional practice

SELECT
    Name AS city_name,
    Population
FROM
    city
WHERE
    Population BETWEEN 1000000 AND 5000000;


SELECT
    Name AS city_name,
    Population
FROM
    city
WHERE
    CountryCode = 'DEU' AND Population > 2000000;


SELECT
    Name AS city_name,
    Population
FROM
    city
WHERE
    District = 'California';


SELECT
    Name AS city_name,
    Population
FROM
    city
WHERE
    Name LIKE 'New%';


SELECT
    Name AS country_name,
    HeadOfState
FROM
    country
WHERE
    HeadOfState IS NULL;


SELECT
    Name AS city_name,
    Population
FROM
    city
ORDER BY
    Population DESC,
    Name ASC;


SELECT
    Name AS country_name,
    Continent,
    Population
FROM
    country
ORDER BY
    Continent ASC,
    Population DESC;


SELECT
    Name AS city_name,
    CountryCode,
    District
FROM
    city
ORDER BY
    CountryCode DESC,
    District ASC;


SELECT
    Name AS city_name,
    Population
FROM
    city
ORDER BY
    Population DESC
LIMIT 5 OFFSET 5;
