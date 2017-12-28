USE LMS;


-- Populate list of Publishers --
EXEC [Library].[uspInsertPublisher] 
	'Picador USA', 
	'175 Fifth Avenue, New York, NY 10010', 
	'800-221-7945';

EXEC [Library].[uspInsertPublisher] 
	'Free Press',
	'Defunct',
	'n/a';

EXEC [Library].[uspInsertPublisher] 
	'New World Library',
	'14 Pamaron Way # 1, Novato, CA 94949',
	'415-884-2100';

EXEC [Library].[uspInsertPublisher] 
	'Random House',
	'1745 Broadway, New York, NY 10019',
	'212-782-9000';

EXEC [Library].[uspInsertPublisher] 
	'Harper Collins',
	'195 Broadway, New York, NY 10007.',
	'800-242-7737';

EXEC [Library].[uspInsertPublisher] 
	'ReganBooks',
	'Defunct',
	'n/a';

EXEC [Library].[uspInsertPublisher] 
	'Plume',
	'1745 Broadway, New York, NY 10019',
	'212-782-9000';

EXEC [Library].[uspInsertPublisher] 
	'Little, Brown and Company',
	'1290 6th Ave, New York, NY 10104',
	'800-759-0190';

EXEC [Library].[uspInsertPublisher] 
	'Tor Books',
	'175 Fifth Avenue, New York, NY',
	'n/a';

EXEC [Library].[uspInsertPublisher] 
	'W. W. Norton Company',
	'500 5th Ave # 6, New York, NY 10110',
	'212-354-5500';

EXEC [Library].[uspInsertPublisher] 
	'William Heinemann',
	'P. O. Box 6926, Portsmouth, NH 03802',
	'800-225-5800';

EXEC [Library].[uspInsertPublisher] 
	'Viking Press',
	'1745 Broadway, New York, NY 10019',
	'212-782-9000';

EXEC [Library].[uspInsertPublisher] 
	'Dell Publishing',
	'1745 Broadway, New York, NY 10019',
	'212-782-9000';

EXEC [Library].[uspInsertPublisher] 
	'Penguin Random House',
	'1745 Broadway, New York, NY 10019',
	'212-782-9000';

EXEC [Library].[uspInsertPublisher] 
	'Charles Scribner''s Sons',
	'12 Lunar Drive, Woodbridge, CT 06525',
	'800-877-4253';

EXEC [Library].[uspInsertPublisher] 
	'Bobbs-Merrill Company',
	'330 Hudson Street, Manhattan, New York 10013',
	'202-909-4520';

EXEC [Library].[uspInsertPublisher] 
	'Harvill Secker',
	'1745 Broadway, New York, NY 10019',
	'212-782-9000';

EXEC [Library].[uspInsertPublisher] 
	'Doubleday',
	'1745 Broadway, New York, NY 10019',
	'212-782-9000';

SELECT * FROM Library.Publisher;

-- Insert records into Library.Book --
EXEC [Library].[uspInsertLibraryBook] 'The Lost Tribe', 'Mark Lee', 'Picador USA';
EXEC [Library].[uspInsertLibraryBook] 'The 7 Habits of Highly Effective People', 'Steven R. Covey', 'Free Press';
EXEC [Library].[uspInsertLibraryBook] 'The Power of Now: A Guide to Spiritual Enlightenment', 'Eckhart Tolle', 'New World Library';
EXEC [Library].[uspInsertLibraryBook] 'Ready Player One', 'Ernest Cline', 'Random House';
EXEC [Library].[uspInsertLibraryBook] 'The Alchemist', 'Paulo Coelho', 'Harper Collins';
EXEC [Library].[uspInsertLibraryBook] 'The Family', 'Mario Puzo', 'ReganBooks';
EXEC [Library].[uspInsertLibraryBook] 'Mastery', 'George Leonard','Plume';
EXEC [Library].[uspInsertLibraryBook] 'Infinite Jest', 'David Foster Wallace', 'Little, Brown and Company';
EXEC [Library].[uspInsertLibraryBook] 'Ender''s Game', 'Orson Scott Card', 'Tor Books';
EXEC [Library].[uspInsertLibraryBook] 'A Game of Thrones', 'George R. R. Martin', 'Penguin Random House';
EXEC [Library].[uspInsertLibraryBook] 'An Elegant Universe', 'Brian Greene', 'W. W. Norton Company';
EXEC [Library].[uspInsertLibraryBook] 'C Programming: A Modern Approach', 'K. N. King',  'W. W. Norton Company';
EXEC [Library].[uspInsertLibraryBook] 'A Clockwork Orange', 'Anthony Burgess', 'William Heinemann';
EXEC [Library].[uspInsertLibraryBook] 'On The Road', 'Jack Kerouac', 'Viking Press';
EXEC [Library].[uspInsertLibraryBook] 'Deadeye Dick', 'Kurt Vonnegut', 'Dell Publishing';
EXEC [Library].[uspInsertLibraryBook] 'Fear and Loathing in Las Vegas', 'Hunter S. Thompson',  'Random House';
EXEC [Library].[uspInsertLibraryBook] 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons';
EXEC [Library].[uspInsertLibraryBook] 'The Fountainhead', 'Ayn Rand', 'Bobbs-Merrill Company';
EXEC [Library].[uspInsertLibraryBook] 'Nineteen Eighty-Four', 'George Orwell', 'Harvill Secker';
EXEC [Library].[uspInsertLibraryBook] 'Fight Club', 'Chuck Palahniuk', 'W. W. Norton Company';
EXEC [Library].[uspInsertLibraryBook] 'The Stand', 'Stephen King', 'Doubleday';
EXEC [Library].[uspInsertLibraryBook] 'The Shining', 'Stephen King', 'Doubleday';

SELECT * FROM Library.Book;


-- Populate the library branches table --
EXEC [Library].[uspInsertLibraryBranch] 
	 'Sharpstown', 
	 '2648 Skinner Hollow Road, Portland, OR, 97207';

EXEC [Library].[uspInsertLibraryBranch] 
	 'Central',
	 '310 SW 4th Ave Suite 412, Portland, OR 97204';

EXEC [Library].[uspInsertLibraryBranch] 
	 'North Portland Library',
	 '512 N Killingsworth St, Portland, OR 97217';

EXEC [Library].[uspInsertLibraryBranch] 
	 'Hillsdale Library',
	 '1525 SW Sunset Blvd, Portland, OR 97239';	

EXEC [Library].[uspInsertLibraryBranch] 
	 'Woodstock Library',
	 '6008 SE 49th Ave, Portland, OR 97206';

EXEC [Library].[uspInsertLibraryBranch] 
	 'Gregory Heights Library',
	 ' 7921 NE Sandy Blvd, Portland, OR 97213';

SELECT * FROM Library.LibraryBranch;


-- Population of branches with books using loops and random numbers --
/* I am going to go ahead and give each branch every book in the table with a
   various number of copies */

-- Find the number of branches and save to @branchCount --
DECLARE @branchCount INT = (SELECT COUNT(*) FROM Library.LibraryBranch);
DECLARE @i INT = 1;

-- Give each library branch 1 single copy of each book --
WHILE @i <= @branchCount
BEGIN
	SELECT BranchID FROM Library.BookCopies
	INSERT INTO Library.BookCopies (BookID, BranchID, NoOfCopies)
		-- This is a bit hackish considering it only works if the branch IDs are 1-6 --
		SELECT BookID, @i, 1 FROM Library.Book;
	SET @i += 1;
END

-- Now set a random number of copies for each book in each library branch --   
UPDATE Library.BookCopies
	SET Library.BookCopies.NoOfCopies = abs(checksum(NewId()) % 10) + 5 -- rand(5,14)
WHERE  Library.BookCopies.NoOfCopies IS NOT NULL

SELECT * FROM Library.BookCopies



-- Populate the borrowers table with random records --
EXEC [Library].[uspInsertLibraryBorrower]
	 'Brendan�T�Griffin', '2459 Illinois Avenue, Portland, OR, 97205', '503-713-4218';
EXEC [Library].[uspInsertLibraryBorrower]
	 'David�J�Anderson', '1642 Karen Lane, Portland, OR, 97230', '503-201-6280';
EXEC [Library].[uspInsertLibraryBorrower]
	 'Regan�J�Carroll', '2144 Kincheloe Road, Portland, OR, 97204', '503-459-2240';
EXEC [Library].[uspInsertLibraryBorrower]
	 'Sandra�R�Anderson', '1764 Heron Way, Portland, OR, 97232', '503-818-4666';
EXEC [Library].[uspInsertLibraryBorrower]
	 'Michael�L�Avila', '2267 Hope Street, Portland, OR, 97230', '971-219-0558';
EXEC [Library].[uspInsertLibraryBorrower]
	 'Eugene�H�Roberts', '2689 Godfrey Street, Portland, OR, 97205', '503-607-5509';
EXEC [Library].[uspInsertLibraryBorrower]
	 'Ora�J�Tye', '1072 Hope Street, Portland, OR, 97232', '971-533-3687';
EXEC [Library].[uspInsertLibraryBorrower]
	 'Ricky�J�Johnson', '3579 Kincheloe Road, Portland, OR, 97205', '503-499-5314';
EXEC [Library].[uspInsertLibraryBorrower]
	 'Kim�R�Wilkinson', '4677 Woodland Terrace, Portland, OR, 97201', '916-875-1852';
EXEC [Library].[uspInsertLibraryBorrower]
	 'Jason�L�Terry', '421 Heron Way, Portland, OR, 97232', '503-810-2869';
-- The only card holder with no books checked out --
EXEC [Library].[uspInsertLibraryBorrower]
	'Idun Reed', '567 Illiterate Rd, Portland, OR, 97206', '503-595-5848';

SELECT * FROM Library.Borrower;




-- Populate the BookLoans table with random data --
DECLARE @i INT = 0;
DECLARE @totalLoaned INT = 250;	-- Number of books to be loaned. dB contains 1225 books
DECLARE @bookID INT;
DECLARE @branchID INT;
DECLARE @borrower INT;
DECLARE @dateOutStart DATE = '2017-10-1'; DECLARE @dateOutEnd DATE = '2017-12-28';
DECLARE @dueDateStart DATE = '2017-12-29'; DECLARE @dueDateEnd DATE = '2018-3-31';
DECLARE @dateOut DATE;	
DECLARE @dueDate DATE;

WHILE @i < @totalLoaned		
BEGIN
	SET @bookID = abs(checksum(NewId()) % 22) + 64	-- Random bookID
	SET @branchID = abs(checksum(NewId()) % 6) + 1	-- Random branchID
	IF (SELECT CopiesLoaned FROM Library.BookCopies 
		WHERE BookID = @BookID
		AND BranchID = @branchID) < (SELECT NoOfCopies FROM Library.BookCopies
									 WHERE BookID = @BookID
									 AND BranchID = @branchID)	
	BEGIN
		UPDATE Library.BookCopies
			SET CopiesLoaned += 1
			WHERE BookID = @bookID AND BranchID = @branchID;
		SET @borrower = abs(checksum(NewId()) % 10) + 1 -- Random borrower
		SET @dateOut = dateadd(day,						-- Random date of borrowing
			rand(checksum(newid()))*(1+datediff(day, @dateOutStart, @dateOutEnd)),
			@dateOutEnd);
		SET @dueDate = dateadd(day,						-- Random due date
			rand(checksum(newid()))*(1+datediff(day, @dueDateStart, @dueDateEnd)),
			@dueDateEnd);
		INSERT INTO Library.BookLoans (BookID, BranchID, CardNo, DateOut, DueDate)
			VALUES (@bookID, @branchID, @borrower, @dateOut, @dueDate);
	END
	SET @i += 1;
END

SELECT * FROM Library.BookLoans

