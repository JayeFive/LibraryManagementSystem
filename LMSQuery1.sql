USE LMS;

CREATE SCHEMA Library;
GO

-- Create Tables --
CREATE TABLE Library.Book (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BookTitle VARCHAR(100) NOT NULL,
	PublisherID INT NOT NULL
);

CREATE TABLE Library.LibraryBranch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(100) NOT NULL,
	BranchAddress VARCHAR(100) NOT NULL
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
	CopiesLoaned INT DEFAULT 0,
	CONSTRAINT fk_bookcopies_bookid FOREIGN KEY (BookID) REFERENCES Library.Book (BookID)
);	



/**********************
*	Populate Tables   *
**********************/

/* It seems to be well known that the IF EXISTS command for preventing duplicates
   within tables can catch a race condition with potential data loss, but in the
   the case of this database, there is only one dB admin and thus a more verbose
   set of language to prevent data loss is out of the scope of this project */


/* Manual book record entry --
   SYNTAX: EXEC [Library].[uspInsertLibraryBook] 
           '<Book Title>', '<Author's Name>', '<Publisher Name>';
*/
ALTER PROCEDURE Library.uspInsertLibraryBook
	(@BookTitle VARCHAR(100),
	 @AuthorName VARCHAR(100),
	 @PublisherName VARCHAR(100))
AS
BEGIN
	-- Check to see if the publisher is in record and terminate the PROC if false--
	IF NOT EXISTS (SELECT * FROM Library.Publisher
				   WHERE PublisherName = @PublisherName)
	BEGIN
		PRINT '*Publisher does not yet exist in the database.' + CHAR(13) + 
		'*Please add the publisher record using:' + CHAR(13) + 
		'EXEC [Library].[uspInsertPublisher] ''<Publisher Name>'', ''<Address>'', ''<Phone>''' + CHAR(13) +
		'*The requested publisher is "' + @PublisherName + '".';
		RETURN;
	END

	-- Check for the existance of book record to prevent duplicates --
	IF NOT EXISTS (SELECT * FROM Library.Book 
						WHERE BookTitle = @BookTitle)
	BEGIN
		-- Find the appropriate publisher ID from the publisher table --
		DECLARE @PublisherID INT;
		SET @PublisherID = (SELECT PublisherID FROM Library.Publisher
							WHERE PublisherName = @PublisherName);
		
		-- Create the book record --
		INSERT INTO Library.Book (BookTitle, PublisherID)
			VALUES (@BookTitle, @PublisherID);
		
		-- Create the author record, find BookID by matching BookTitle --
		DECLARE @BookID INT;
		SET @BookID = (SELECT Library.Book.BookID
						FROM Library.Book
						WHERE BookTitle = @BookTitle
						);
		INSERT INTO Library.BookAuthors (BookID, AuthorName)
			VALUES (@BookID, @AuthorName);
	END
END



/* Manual publisher record entry -- 
   SYNTAX: [Library].[uspInsertPublisher] 
		   '<Publisher Name>', '<Address>', '<Phone>'
*/
ALTER PROCEDURE Library.uspInsertPublisher
	(@PublisherName VARCHAR(100),
	 @PublisherAddress VARCHAR(100),
	 @PublisherPhone VARCHAR(100))
AS
BEGIN
	-- Check for the existance of a publisher record to prevent duplicates --
	IF NOT EXISTS (SELECT * FROM Library.Publisher
                   WHERE PublisherName = @PublisherName)
	BEGIN
		INSERT INTO Library.Publisher (PublisherName, PublisherAddress, PublisherPhone)
			VALUES (@PublisherName, @PublisherAddress, @PublisherPhone);
	END
END


/* Manual library branch record entry --
   SYNTAX: [Library].[uspInsertLibraryBranch]
		   '<Branch Name>', '<Branch Address>'
*/
ALTER PROCEDURE Library.uspInsertLibraryBranch
	(@BranchName VARCHAR(100),
	 @BranchAddress VARCHAR(100))
AS
BEGIN
	-- Check for the existance of a library branch to prevent duplicates --
	IF NOT EXISTS (SELECT * FROM Library.LibraryBranch
				   WHERE BranchName = @BranchName)
	BEGIN
		INSERT INTO Library.LibraryBranch (BranchName, BranchAddress)
			VALUES (@BranchName, @BranchAddress);
	END
END



/* Manual Entry of Library.Borrowers table
   SYNTAX: [Library].[uspInsertLibraryBorrower]
		   '<Borrower Name>', '<Address>', '<Phone>'	
*/
ALTER PROCEDURE Library.uspInsertLibraryBorrower
	(@BorrowerName VARCHAR(100),
	 @BorrowerAddress VARCHAR(100),
	 @BorrowerPhone VARCHAR(100))
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Library.Borrower
				   WHERE Borrower.BorrowerName = @BorrowerName)
	BEGIN
		INSERT INTO Library.Borrower (BorrowerName, BorrowerAddress, BorrowerPhone)
			VALUES (@BorrowerName, @BorrowerAddress, @BorrowerPhone);	
	END
END


