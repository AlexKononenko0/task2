--This file containing a another select`s for another table from task2.
SELECT *
FROM public.role
ORDER BY name DESC;

SELECT *
FROM public.role
WHERE name LIKE '%adm%';

SELECT *
FROM public.role
WHERE name LIKE 'c_____';

SELECT *
FROM public.author
WHERE author_name = 'Lev';

SELECT *
FROM public.author
WHERE author_name IN ('Jane');

SELECT *
FROM public.author
WHERE author_name NOT IN ('Lev', 'Jane');

SELECT *
FROM public.author
WHERE author_name = 'Jane' AND id > 1;

SELECT *
FROM public.author
WHERE author_name IN ('Jane') OR id > 2;

SELECT *
FROM public.role 
ORDER BY name;

SELECT *
FROM public.role 
ORDER BY name DESC;

SELECT name AS newcol FROM public.user;
UNION 
SELECT title FROM public.book;

SELECT id FROM public.author
WHERE author_name LIKE 'L%'
UNION
SELECT id FROM public.author
WHERE date_of_birth = '19.10.1946'
UNION
SELECT id FROM public.author
WHERE date_of_birth = '19.10.1946'
ORDER BY id;


SELECT DISTINCT title FROM public.book;

SELECT * 
FROM public.user AS U
INNER JOIN public.role AS R
ON U.role_id = R.id;

SELECT * 
FROM public.user AS U
LEFT JOIN public.role AS R
ON U.role_id = R.id
AND R.id = '1';

SELECT * 
FROM public.book AS B
RIGHT JOIN public.author AS A
ON B.title = A.author_name;
--AND R.id = '1';

SELECT COUNT(id)
FROM public.user;

SELECT SUM(id)
FROM public.user;

SELECT ABS(id)
FROM public.user;

SELECT MAX(id)
FROM public.role;

SELECT AVG(id)
FROM public.role;

SELECT R.name, COUNT(U.id) AS user_count
FROM public.user AS U
INNER JOIN public.role AS R
ON U.role_id = R.id
GROUP BY R.name
HAVING R.name LIKE 'c%';

