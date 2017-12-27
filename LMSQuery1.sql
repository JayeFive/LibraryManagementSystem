CREATE SCHEMA Library;
GO

-- Create Tables --
CREATE TABLE Library.Book (
	BookID INT PRIMARY KEY NOT NULL,
	BookTitle VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(100) NOT NULL
);

CREATE TABLE Library.LibraryBranch (
	BranchID INT PRIMARY KEY NOT NULL,
	BranchName VARCHAR(100) NOT NULL,
	Address VARCHAR(100) NOT NULL
);

CREATE TABLE Library.Borrower (
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR(100) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(100) NOT NULL,
);

CREATE TABLE Library.BookAuthors (
	BookID INT NOT NULL,
	AuthorName VARCHAR(100) NOT NULL,
	CONSTRAINT fk_bookid FOREIGN KEY (BookID) REFERENCES Library.Book (BookID) 
);

CREATE TABLE Library.Publisher (
	Name VARCHAR(100) PRIMARY KEY NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(100) NOT NULL,
);

CREATE TABLE Library.BookLoans (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	CardNo INT NOT NULL,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL,
	CONSTRAINT fk_bookloan_bookid FOREIGN KEY (BookID) REFERENCES Library.Book (BookID),
	CONSTRAINT fk_cardno FOREIGN KEY (CardNo) REFERENCES Library.Borrower (CardNo)
);

CREATE TABLE Library.BookCopies (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	NoOfCopies INT NOT NULL,
	CONSTRAINT fk_bookcopies_bookid FOREIGN KEY (BookID) REFERENCES Library.Book (BookID)
);	


