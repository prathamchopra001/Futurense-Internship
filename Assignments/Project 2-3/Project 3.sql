-- USE bookstoredb;
-- -- Populate Initial Data with Realistic Values
-- INSERT INTO Authors (AuthorID, Name, Bio) VALUES
-- (1, 'J.K. Rowling', 'British author best known for her Harry Potter series.'),
-- (2, 'George R.R. Martin', 'American novelist and short story writer, best known for A Song of Ice and Fire series.'),
-- (3, 'Agatha Christie', 'English writer known for her detective novels and short story collections.'),
-- (4, 'Michelle Obama', 'Former First Lady of the United States and author of the memoir "Becoming."'),
-- (5, 'Dan Brown', 'American author best known for his thriller novels, including The Da Vinci Code.');

-- INSERT INTO Books (BookID, Title, AuthorID, Price, PublicationDate, Genre) VALUES
-- (1, 'Harry Potter and the Sorcerer''s Stone', 1, 15.99, '1997-06-26', 'Fantasy'),
-- (2, 'A Game of Thrones', 2, 12.99, '1996-08-06', 'Fantasy'),
-- (3, 'Murder on the Orient Express', 3, 10.99, '1934-01-01', 'Mystery'),
-- (4, 'Becoming', 4, 19.99, '2018-11-13', 'Biography'),
-- (5, 'The Da Vinci Code', 5, 14.99, '2003-03-18', 'Thriller');

-- INSERT INTO Sales (SaleID, BookID, QuantitySold, SaleDate) VALUES
-- (1, 1, 20, '2023-01-20'),
-- (2, 2, 30, '2023-02-05'),
-- (3, 3, 15, '2023-02-15'),
-- (4, 4, 25, '2023-03-10'),
-- (5, 5, 10, '2023-03-20');

-- Conditional Insertion for Promotions
CREATE TABLE IF NOT EXISTS NewReleases AS
SELECT * FROM Books
WHERE PublicationDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);


-- Dynamic Pricing Update
ALTER TABLE Books
ADD COLUMN StockQuantity INT DEFAULT 0;
UPDATE Books
SET Price = Price * 1.1
WHERE BookID IN (
    SELECT BookID
    FROM Sales
    WHERE QuantitySold > 50 AND SaleDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
);

UPDATE Books
SET Price = Price * 0.95
WHERE BookID NOT IN (
    SELECT BookID
    FROM Sales
    WHERE SaleDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH)
);


-- Stock Adjustment
UPDATE Books 
JOIN (
    SELECT BookID, SUM(QuantitySold) AS TotalSold
    FROM Sales
    GROUP BY BookID
) s ON Books.BookID = s.BookID
SET Books.StockQuantity = IFNULL(Books.StockQuantity, 0) - s.TotalSold;

-- Sales Record Cleanup
DELETE FROM Sales
WHERE SaleDate < DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR);

-- TRUNCATE TABLE to reset Sales at the beginning of a new fiscal year
-- TRUNCATE TABLE Sales;
