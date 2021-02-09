CREATE OR REPLACE FORCE VIEW "vYearBook" AS 
SELECT Books.BookID, Books.BookName, Temp1.YearID
FROM Books
INNER JOIN Temp1
ON Books.BookName = Temp1.Book;