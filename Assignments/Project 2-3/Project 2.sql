DROP DATABASE Bookstoredb;
CREATE DATABASE IF NOT EXISTS BookstoreDB;
USE bookstoredb;


-- Create Authors Table
CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(255),
    Bio TEXT
);

-- Create Books Table
CREATE TABLE IF NOT EXISTS Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    AuthorID INT,
    Price DECIMAL(10, 2),
    PublicationDate DATE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Sales Table
CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT PRIMARY KEY,
    BookID INT,
    QuantitySold INT,
    SaleDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Add Genre column to Books table
ALTER TABLE Books
ADD COLUMN Genre VARCHAR(100);

-- Alter data types and constraints for data integrity (if needed)
-- ALTER TABLE Books
-- MODIFY COLUMN Price DECIMAL(10, 2) CHECK (Price > 0);

-- Prepare for end-of-year data reset in the Sales table
-- TRUNCATE TABLE Sales;

-- DROP TABLE Authors;


-- Reflect changes in the inventory system by renaming the Books table
-- RENAME TABLE Books TO Materials;

