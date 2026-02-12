# Library Management System

## Overview
This is a **Library Management System** implemented using **SQL Server (T-SQL)**.  
It is a mock project designed for academic purposes (finals submission) and demonstrates the use of **database creation, table relationships, CRUD operations, and reporting queries**.

The system manages:

- **Authors**: Information about book authors  
- **Books**: Catalog of books in the library  
- **Members**: Library members who borrow books  
- **Staff**: Library staff members  
- **Borrowings**: Tracks which member borrowed which book and when

---

## Database Structure

### Tables

| Table      | Description |
|-----------|-------------|
| Authors   | Stores author information (AuthorID, Name, Country) |
| Books     | Stores books (BookID, Title, AuthorID, Genre, Quantity) |
| Members   | Stores library members (MemberID, Name, Email, Phone, JoinDate) |
| Staff     | Stores library staff (StaffID, Name, Position, Email) |
| Borrowings| Tracks book borrowing (BorrowID, MemberID, BookID, BorrowDate, ReturnDate) |

---

## Files

- `create_tables.sql` – Contains all `CREATE DATABASE` and `CREATE TABLE` statements  
- `insert_data.sql` – Contains sample `INSERT` statements to populate tables  
- `queries.sql` – Contains CRUD operations and advanced reporting queries (e.g., most borrowed books, overdue books)  

---

## Features / Queries

- View all books with author names  
- Add, update, and delete records  
- Track borrowed books and overdue books  
- Generate reports such as most borrowed books  

---

## How to Use

1. Open **SQL Server Management Studio (SSMS)**.  
2. Create a new query and paste the SQL scripts in the following order:
   1. `create_tables.sql`  
   2. `insert_data.sql`  
   3. `queries.sql`  
3. Execute the scripts.  
4. The database `LibraryDB` with all tables, sample data, and queries will be ready.  

---

## Notes

- This project uses **T-SQL (SQL Server syntax)**. Some syntax (like `IDENTITY` for auto-increment and `GETDATE()` for current date) may need adjustment for other SQL systems.  
- The project is intended for learning and demonstration purposes only.  

---

## Author

- [Your Name]  
- Academic Project / Finals Submission  

