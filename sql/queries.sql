DROP TABLE rating;
DROP TABLE holds;
DROP TABLE loans;
DROP TABLE book_categories;
DROP TABLE book_availability;
DROP TABLE users;
DROP TABLE books;
DROP TABLE libraries;
-- buku yang favorit itu based on rating or loans
-- buku yang jadi incaran atau antriannya banyak
-- 
-- SELECT "categories", COUNT(*) AS "n_books"
-- FROM (
-- 	SELECT UNNEST("categories") AS "categories" FROM "book_categories"
--     ) AS "unnested_categories"
-- GROUP BY "categories"
-- ORDER BY "n_books" desc;

-- SELECT
--     b.title,
--     b.author,
--     COUNT(l.book_id) AS borrow_count,
--     EXTRACT(MONTH FROM l.loan_date) AS borrow_month
-- FROM
--     loans l
-- JOIN
--     books b ON l.book_id = b.book_id
-- GROUP BY
--     b.title, b.author, EXTRACT(MONTH FROM l.loan_date)
-- ORDER BY
--     borrow_month, borrow_count DESC;	
-- SELECT
--     EXTRACT(MONTH FROM l.loan_date) AS borrow_month,
--     STRING_AGG(CONCAT(b.title, ' by ', b.author), ', ') AS frequently_borrowed_books
-- FROM
--     loans l
-- JOIN
--     books b ON l.book_id = b.book_id
-- GROUP BY
--     EXTRACT(MONTH FROM l.loan_date)
-- ORDER BY
--     borrow_month;


-- Question 1

CREATE VIEW library_available_books_count AS
SELECT 
    l.library_id,
    l.library_name,
    COUNT(ba.book_id) AS available_books_count
FROM
    libraries l
LEFT JOIN
    book_availability ba ON l.library_id = ba.library_id
GROUP BY
    l.library_id, l.library_name;

SELECT * FROM library_available_books_count;

-- Question 2

SELECT
    l.user_id,
    u.username,
    u.name,
    COUNT(*) AS total_borrows
FROM
    loans l
JOIN
    users u ON l.user_id = u.user_id
GROUP BY
    l.user_id, u.username, u.name
ORDER BY
    total_borrows DESC
LIMIT 10;

-- -- Question 3

-- SELECT
--     b.book_id,
--     b.title,
--     COUNT(l.book_id) AS borrow_count
-- FROM
--     books b
-- JOIN
--     loans l ON b.book_id = l.book_id
-- GROUP BY
--     b.book_id, b.title, b.author
-- ORDER BY
--     borrow_count DESC
-- LIMIT 10;

-- Question 3

SELECT
    b.book_id,
    b.title,
    COUNT(h.book_id) AS hold_count
FROM
    books b
JOIN
    holds h ON b.book_id = h.book_id
GROUP BY
    b.book_id, b.title, b.author
ORDER BY
    hold_count DESC
LIMIT 10;

-- Question 4

SELECT
    COUNT(DISTINCT l.user_id) AS borrowed_count,
    (SELECT COUNT(*) FROM users) - COUNT(DISTINCT l.user_id) AS never_borrowed_count
FROM
    loans l;

-- Question 5

SELECT
    u.user_id,
    u.username,
    u.name,
    u.email
FROM
    users u
LEFT JOIN
    loans l ON u.user_id = l.user_id
WHERE
    l.user_id IS NULL;