-- =====================
-- 1. CREATE DATABASE
-- =====================
CREATE DATABASE LibraryDB;
GO
USE LibraryDB;
GO

-- =====================
-- 2. CREATE TABLES
-- =====================

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Country NVARCHAR(50)
);

-- Books Table
CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(150) NOT NULL,
    AuthorID INT FOREIGN KEY REFERENCES Authors(AuthorID),
    Genre NVARCHAR(50),
    Quantity INT DEFAULT 1
);

-- Members Table
CREATE TABLE Members (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    JoinDate DATE DEFAULT GETDATE()
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(50),
    Email NVARCHAR(100)
);

-- Borrowings Table
CREATE TABLE Borrowings (
    BorrowID INT IDENTITY(1,1) PRIMARY KEY,
    MemberID INT FOREIGN KEY REFERENCES Members(MemberID),
    BookID INT FOREIGN KEY REFERENCES Books(BookID),
    BorrowDate DATE DEFAULT GETDATE(),
    ReturnDate DATE
);

-- =====================
-- 3. INSERT SAMPLE DATA
-- =====================

-- Authors
INSERT INTO Authors (Name, Country) VALUES
('J.K. Rowling', 'UK'),
('George Orwell', 'UK'),
('Harper Lee', 'USA');

-- Books
INSERT INTO Books (Title, AuthorID, Genre, Quantity) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 'Fantasy', 5),
('1984', 2, 'Dystopian', 3),
('To Kill a Mockingbird', 3, 'Fiction', 4);

-- Members
INSERT INTO Members (Name, Email, Phone) VALUES
('Alice Smith', 'alice@example.com', '1234567890'),
('Bob Johnson', 'bob@example.com', '0987654321');

-- Staff
INSERT INTO Staff (Name, Position, Email) VALUES
('Librarian John', 'Head Librarian', 'john@library.com'),
('Assistant Mary', 'Assistant Librarian', 'mary@library.com');

-- Borrowings
INSERT INTO Borrowings (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, '2026-02-01', NULL),
(2, 2, '2026-02-05', '2026-02-10');

-- =====================
-- 4. CRUD & REPORT QUERIES
-- =====================

-- View all books with authors
SELECT b.BookID, b.Title, a.Name AS Author, b.Genre, b.Quantity
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;

-- Add a new book
INSERT INTO Books (Title, AuthorID, Genre, Quantity)
VALUES ('Animal Farm', 2, 'Political Satire', 2);

-- Update book quantity
UPDATE Books
SET Quantity = Quantity + 2
WHERE BookID = 1;

-- Delete a member
DELETE FROM Members
WHERE MemberID = 2;

-- Books currently borrowed
SELECT m.Name AS Member, b.Title AS Book, br.BorrowDate
FROM Borrowings br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
WHERE br.ReturnDate IS NULL;

-- Most borrowed books
SELECT b.Title, COUNT(*) AS TimesBorrowed
FROM Borrowings br
JOIN Books b ON br.BookID = b.BookID
GROUP BY b.Title
ORDER BY TimesBorrowed DESC;

-- Members with overdue books (more than 14 days)
SELECT m.Name, b.Title, br.BorrowDate, DATEDIFF(DAY, br.BorrowDate, GETDATE()) AS DaysBorrowed
FROM Borrowings br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
WHERE br.ReturnDate IS NULL
AND DATEDIFF(DAY, br.BorrowDate, GETDATE()) > 14;

