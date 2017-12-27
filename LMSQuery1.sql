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



/**********************
*	Populate Tables   *
**********************/


-- Enter a new book and check for duplicates --
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

EXEC [Library].[uspInsertLibraryBook] 'The Lost Tribe', 'West 26th Street Press';
EXEC [Library].[uspInsertLibraryBook] 'The 7 Habits of Highly Effective People', 'Free Press';
EXEC [Library].[uspInsertLibraryBook] 'The Power of Now: A Guide to Spiritual Enlightenment', 'New World Library';
EXEC [Library].[uspInsertLibraryBook] 'Ready Player One', 'Random House';
EXEC [Library].[uspInsertLibraryBook] 'The Alchemist', 'Harper Collins';
EXEC [Library].[uspInsertLibraryBook] 'The Family', 'Regan Books';
EXEC [Library].[uspInsertLibraryBook] 'Mastery', 'Plume';
EXEC [Library].[uspInsertLibraryBook] 'Infinite Jest', 'Little, Brown and Company';
EXEC [Library].[uspInsertLibraryBook] 'Ender''s Game', 'Tor Books';
EXEC [Library].[uspInsertLibraryBook] 'A Game of Thrones', 'Penguin Random House';
EXEC [Library].[uspInsertLibraryBook] 'An Elegant Universe', 'W. W. Norton Company';
EXEC [Library].[uspInsertLibraryBook] 'C Programming: A Modern Approach', 'W. W. Norton Company';
EXEC [Library].[uspInsertLibraryBook] 'A Clockwork Orange', 'William Heinemann';
EXEC [Library].[uspInsertLibraryBook] 'On The Road', 'Viking Press';
EXEC [Library].[uspInsertLibraryBook] 'Deadeye Dick', 'Dell Publishing';
EXEC [Library].[uspInsertLibraryBook] 'Fear and Loathing in Las Vegas', 'Random House';
EXEC [Library].[uspInsertLibraryBook] 'The Great Gatsby', 'Charles Scribner''s Sons';
EXEC [Library].[uspInsertLibraryBook] 'The Fountainhead', 'Bobbs-Merrill Company';
EXEC [Library].[uspInsertLibraryBook] 'Nineteen Eighty-Four', 'Harvill Secker';
EXEC [Library].[uspInsertLibraryBook] 'Fight Club', 'W. W. Norton Company';




-- Enter author based on non-duplicate and find primary key --
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



EXEC [Library].[uspInsertLibraryBookAuthors] 'The Lost Tribe', 'Mark Lee';
EXEC [Library].[uspInsertLibraryBookAuthors] 'The 7 Habits of Highly Effective People', 'Steven R. Covey';
EXEC [Library].[uspInsertLibraryBookAuthors] 'The Power of Now: A Guide to Spiritual Enlightenment', 'Eckhart Tolle';
EXEC [Library].[uspInsertLibraryBookAuthors] 'Ready Player One', 'Ernest Cline';
EXEC [Library].[uspInsertLibraryBookAuthors] 'The Alchemist', 'Paulo Coelho';
EXEC [Library].[uspInsertLibraryBookAuthors] 'The Family', 'Mario Puzo';
EXEC [Library].[uspInsertLibraryBookAuthors] 'Mastery', 'George Leonard';
EXEC [Library].[uspInsertLibraryBookAuthors] 'Infinite Jest', 'David Foster Wallace';
EXEC [Library].[uspInsertLibraryBookAuthors] 'Ender''s Game', 'Orson Scott Card';
EXEC [Library].[uspInsertLibraryBookAuthors] 'A Game of Thrones', 'George R. R. Martin'; 
EXEC [Library].[uspInsertLibraryBookAuthors] 'An Elegant Universe', 'Brian Greene'; 
EXEC [Library].[uspInsertLibraryBookAuthors] 'C Programming: A Modern Approach', 'K. N. King';
EXEC [Library].[uspInsertLibraryBookAuthors] 'A Clockwork Orange', 'Anthony Burgess';
EXEC [Library].[uspInsertLibraryBookAuthors] 'On The Road', 'Jack Kerouac';
EXEC [Library].[uspInsertLibraryBookAuthors] 'Deadeye Dick', 'Kurt Vonnegut';
EXEC [Library].[uspInsertLibraryBookAuthors] 'Fear and Loathing in Las Vegas', 'Hunter S. Thompson';
EXEC [Library].[uspInsertLibraryBookAuthors] 'The Great Gatsby', 'F. Scott Fitzgerald';
EXEC [Library].[uspInsertLibraryBookAuthors] 'The Fountainhead', 'Ayn Rand';
EXEC [Library].[uspInsertLibraryBookAuthors] 'Nineteen Eighty-Four', 'George Orwell';
EXEC [Library].[uspInsertLibraryBookAuthors] 'Fight Club', 'Chuck Palahniuk';




SELECT * FROM Library.Book lb
LEFT JOIN Library.BookAuthors ba ON lb.BookID = ba.BookID;

SELECT * FROM Library.BookAuthors
