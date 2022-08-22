# SELECT 
# 	CONCAT
#     (
#     	SUBSTRING(title, 1, 10),
#         '...'
#     ) AS 'short title'
# FROM books;

# SELECT SUBSTRING(
#     REPLACE(title, 'e', '3'), 1, 10
# ) AS 'weird name'
# FROM books;

# SELECT CONCAT(author_fname, ' ', REVERSE(author_fname)) AS 'reverse name' FROM books;

# SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') AS 'length name' FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) AS 'FAV BOOK' FROM books;