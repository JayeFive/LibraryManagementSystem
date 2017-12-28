USE LMS;

/* 1. How many copies of the book titled "The Lost Tribe" are owned by the 
   library branch whose name is "Sharpstown"?*/

SELECT NoOfCopies FROM Library.BookCopies bc
	INNER JOIN Library.Book b ON bc.BookID = b.BookID
	INNER JOIN Library.LibraryBranch br ON bc.BranchID = br.BranchID
	WHERE  BookTitle = 'The Lost Tribe'
	AND BranchName = 'Sharpstown';

/* 2. How many copies of the book titled "The Lost Tribe" are owned by each 
   library branch? */

SELECT BranchName, NoOfCopies
	FROM Library.BookCopies bc
	INNER JOIN Library.Book b ON bc.BookID = b.BookID
	INNER JOIN Library.LibraryBranch br ON bc.BranchID = br.BranchID
	WHERE BookTitle = 'The Lost Tribe';
	
/* 3. Retrieve the names of all borrowers who do not have any books checked 
   out. */
/* Sadly the residents that make up this database are avid readers. I'll add a
   new card holder named Idun Reed to check this query */ 
SELECT BorrowerName FROM Library.Borrower bw
	WHERE bw.CardNo NOT IN (SELECT CardNo FROM Library.BookLoans)

/* 4. For each book that is loaned out from the "Sharpstown" branch and whose 
   DueDate is today, retrieve the book title, the borrower's name, and the borrower's 
   address. */

SELECT BookTitle, BorrowerName, BorrowerAddress FROM Library.BookLoans bl
	INNER JOIN Library.Book b ON b.BookID = bl.BookID
	INNER JOIN Library.Borrower bw ON bl.CardNo = bw.CardNo
	INNER JOIN Library.LibraryBranch br ON bl.BranchID = br.BranchID
	WHERE DueDate = '2018-4-20'
	AND BranchName = 'Sharpstown'

/* 5. For each library branch, retrieve the branch name and the total number of books 
   loaned out from that branch. */

SELECT BranchName, SUM(CopiesLoaned) FROM Library.LibraryBranch br
	LEFT JOIN Library.BookCopies bc ON br.BranchID = bc.BranchID
	GROUP BY BranchName

/* 6. Retrieve the names, addresses, and number of books checked out for all 
   borrowers who have more than five books checked out. */

SELECT BorrowerName, COUNT(BookID) AS NumBooks FROM Library.BookLoans bl
	INNER JOIN Library.Borrower bw ON bl.CardNo = bw.CardNo	
	GROUP BY bw.BorrowerName
	HAVING COUNT(BookID) > 5 

/* 7. For each book authored (or co-authored) by "Stephen King", retrieve the title 
   and the number of copies owned by the library branch whose name is "Central". */

SELECT BookTitle, NoOfCopies FROM Library.BookCopies bc
	INNER JOIN Library.Book b ON bc.BookID = b.BookID
	INNER JOIN Library.LibraryBranch br ON bc.BranchID = br.BranchID
	INNER JOIN Library.BookAuthors ba ON bc.BookID = ba.BookID
	WHERE AuthorName = 'Stephen King'
	AND BranchName = 'Central'
	
	
	
	

	