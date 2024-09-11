# Library-Management-System-in-SQL
This project involves designing a simple library management system using SQL. The system manages information about books, authors, and borrowers, and allows you to perform various operations such as adding new books, registering borrowers, and tracking which books are borrowed.
Overview
The "Library Management System" project uses SQL to manage a library’s database, including information on books, authors, borrowers, and borrowed books. This system is designed to keep track of library operations and retrieve various pieces of information related to books and their borrowing status.

Features
Database Schema:

Authors Table: Stores information about authors.
Books Table: Stores details about books, including the author ID which links to the Authors table.
Borrowers Table: Contains information about library borrowers.
BorrowedBooks Table: Tracks which books are borrowed by which borrowers and includes borrow and return dates.
Sample Data:

Includes sample data for authors, books, borrowers, and borrowing records.
Query Examples:

List All Books and Their Authors: Retrieves all books with the author's name.
List All Borrowers and the Books They Have Borrowed: Shows which books are borrowed by which borrowers.
Find All Books That Are Currently Borrowed: Lists books that have been borrowed and are not yet returned.
Code Breakdown
Database Creation:

The script starts by creating a database named LibraryDB and setting it as the active database.
Table Creation:

Defines the schema for the Authors, Books, Borrowers, and BorrowedBooks tables with appropriate fields and relationships.
Data Insertion:

Inserts sample data into the Authors, Books, Borrowers, and BorrowedBooks tables.
Query Examples:

Provides SQL queries for common operations, such as listing all books with authors, finding borrowed books, and listing borrowers and borrowed books.
Customization
This basic library management system can be expanded in several ways:

Additional Features: Implement features such as overdue notifications, fine calculations, or book reservations.
More Detailed Records: Add more fields to the tables, such as book genres, borrower addresses, or book conditions.
User Interface: Build a user interface (web or desktop) to interact with the database, making it more user-friendly for library staff and patrons.
This project provides a foundational understanding of SQL and database management, and serves as a solid base for more complex database systems.
