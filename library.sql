-- Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Create tables

-- Authors table
CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Books table
CREATE TABLE IF NOT EXISTS Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    PublishedYear INT,
    ISBN VARCHAR(20),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Borrowers table
CREATE TABLE IF NOT EXISTS Borrowers (
    BorrowerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- BorrowedBooks table
CREATE TABLE IF NOT EXISTS BorrowedBooks (
    BorrowedBookID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

-- Insert sample data

-- Insert authors
INSERT INTO Authors (FirstName, LastName) VALUES
('George', 'Orwell'),
('J.K.', 'Rowling'),
('J.R.R.', 'Tolkien');

-- Insert books
INSERT INTO Books (Title, AuthorID, PublishedYear, ISBN) VALUES
('1984', 1, 1949, '9780451524935'),
('Harry Potter and the Sorcerer\'s Stone', 2, 1997, '9780747532699'),
('The Hobbit', 3, 1937, '9780345339683');

-- Insert borrowers
INSERT INTO Borrowers (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

-- Insert borrowed books
INSERT INTO BorrowedBooks (BookID, BorrowerID, BorrowDate, ReturnDate) VALUES
(1, 1, '2024-01-15', '2024-02-15'),
(2, 2, '2024-01-20', NULL); -- NULL indicates the book has not been returned yet

-- Query examples

-- 1. List all books and their authors
SELECT 
    b.Title, 
    CONCAT(a.FirstName, ' ', a.LastName) AS Author, 
    b.PublishedYear, 
    b.ISBN
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;

-- 2. List all borrowers and the books they have borrowed
SELECT 
    CONCAT(b.FirstName, ' ', b.LastName) AS Borrower,
    bk.Title AS BookTitle,
    bb.BorrowDate,
    bb.ReturnDate
FROM BorrowedBooks bb
JOIN Borrowers b ON bb.BorrowerID = b.BorrowerID
JOIN Books bk ON bb.BookID = bk.BookID;

-- 3. Find all books that are currently borrowed
SELECT 
    bk.Title AS BookTitle,
    CONCAT(b.FirstName, ' ', b.LastName) AS Borrower,
    bb.BorrowDate
FROM BorrowedBooks bb
JOIN Books bk ON bb.BookID = bk.BookID
JOIN Borrowers b ON bb.BorrowerID = b.BorrowerID
WHERE bb.ReturnDate IS NULL;
