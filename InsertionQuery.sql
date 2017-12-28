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

-- Populate the library card holders table --