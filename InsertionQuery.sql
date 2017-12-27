USE LMS;



-- Insert records into Library.Book --

EXEC [Library].[uspInsertLibraryBook] 'The Lost Tribe', 'Mark Lee', 'Picador USA';


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

	

EXEC [Library].[uspInsertLibraryBook] 'The 7 Habits of Highly Effective People', 'Steven R. Covey', 'Free Press';
EXEC [Library].[uspInsertLibraryBook] 'The Power of Now: A Guide to Spiritual Enlightenment', 'New World Library';
EXEC [Library].[uspInsertLibraryBook] 'Ready Player One', 'Random House';
EXEC [Library].[uspInsertLibraryBook] 'The Alchemist', 'Harper Collins';
EXEC [Library].[uspInsertLibraryBook] 'The Family', 'ReganBooks';
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
EXEC [Library].[uspInsertLibraryBook] 'The Stand', 'Doubleday';
EXEC [Library].[uspInsertLibraryBook] 'The Shining', 'Doubleday';



/* I am starting to realize that I could probably join the 2 procs together into one
   happy little proc that has 3 parameters instead of 2 */

-- Insert records into Library.BookAuthors --
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
EXEC [Library].[uspInsertLibraryBookAuthors] 'The Stand', 'Stephen King';
EXEC [Library].[uspInsertLibraryBookAuthors] 'The Shining', 'Stephen King';