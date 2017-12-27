USE LMS;

CREATE SCHEMA Library;
GO

-- Create Tables --
CREATE TABLE Library.Book (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BookTitle VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(100) NOT NULL
);


CREATE TABLE Library.LibraryBranch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(100) NOT NULL,
	Address VARCHAR(100) NOT NULL
);

CREATE TABLE Library.Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BorrowerName VARCHAR(100) NOT NULL,
	BorrowerAddress VARCHAR(100) NOT NULL,
	BorrowerPhone VARCHAR(100) NOT NULL,
);

CREATE TABLE Library.BookAuthors (
	BookID INT NOT NULL,
	AuthorName VARCHAR(100) NOT NULL,
	CONSTRAINT fk_bookid FOREIGN KEY (BookID) REFERENCES Library.Book (BookID) 
);

CREATE TABLE Library.Publisher (
	PublisherID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	PublisherName VARCHAR(100) NOT NULL,
	PublisherAddress VARCHAR(100) NOT NULL,
	PublisherPhone VARCHAR(100) NOT NULL,
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



/**********************
*	Populate Tables   *
**********************/


-- Enter a new book and check for duplicates
-- SYNTAX: [Library].[uspInsertLibraryBook] 'Book Title', 'Publisher Name';
ALTER PROCEDURE Library.uspInsertLibraryBook
	(@BookTitle VARCHAR(100),
	 @PublisherName VARCHAR(100))
AS
BEGIN
   IF NOT EXISTS (SELECT * FROM Library.Book 
                   WHERE BookTitle = @BookTitle
                   AND PublisherName = @PublisherName)
   BEGIN
       INSERT INTO Library.Book (BookTitle, PublisherName)
       VALUES (@BookTitle, @PublisherName)
   END
END



-- Enter author based on non-duplicate and find primary key --
-- SYNTAX: [Library].[uspInsertLibraryBookAuthors] 'Book Title', 'Author's Name';
ALTER PROCEDURE Library.uspInsertLibraryBookAuthors
	(@BookTitle VARCHAR(100),
	 @BookAuthor VARCHAR(100))
AS
BEGIN
	IF EXISTS (SELECT * FROM Library.Book
                   WHERE BookTitle = @BookTitle)
	BEGIN
		DECLARE @BookID INT;
		SET @BookID = (SELECT Library.Book.BookID
						FROM Library.Book
						WHERE BookTitle = @BookTitle
						);
		IF NOT EXISTS (SELECT *
					   FROM Library.BookAuthors
					   WHERE @BookID = Library.BookAuthors.BookID)
		BEGIN
			INSERT INTO Library.BookAuthors (BookID, AuthorName)
			VALUES (@BookID, @BookAuthor)
		END
	END
END


-- Enter a publisher --
-- SYNTAX: [Library].[uspInsertPublisher] 'Publisher Name', 'Address', 'Phone';
ALTER PROCEDURE Library.uspInsertPublisher
	(@PublisherName VARCHAR(100),
	 @PublisherAddress VARCHAR(100),
	 @PublisherPhone VARCHAR(100))
AS
BEGIN
   IF NOT EXISTS (SELECT * FROM Library.Publisher
                   WHERE PublisherName = @PublisherName)
   BEGIN
       INSERT INTO Library.Publisher (PublisherName, PublisherAddress, PublisherPhone)
       VALUES (@PublisherName, @PublisherAddress, @PublisherPhone)
   END
END









SELECT * FROM Library.Book lb
LEFT JOIN Library.BookAuthors ba ON lb.BookID = ba.BookID;


