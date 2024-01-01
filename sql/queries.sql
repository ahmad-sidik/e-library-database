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
SELECT "categories", COUNT(*) AS "n_books"
FROM (
	SELECT UNNEST("categories") AS "categories" FROM "book_categories"
    ) AS "unnested_categories"
GROUP BY "categories"
ORDER BY "n_books" desc;

