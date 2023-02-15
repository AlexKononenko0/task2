--This file created two index, one sequence and 2 view .
DROP INDEX IF EXISTS "IX_author_author_name";

CREATE UNIQUE INDEX "IX_author_author_name"
    ON public.author
    (author_name ASC NULLS LAST)
;

DROP INDEX IF EXISTS "IX_book_title";

CREATE UNIQUE INDEX "IX_book_title"
    ON public.book
    (title ASC NULLS LAST)
;

DROP SEQUENCE IF EXISTS book_sequence;

CREATE SEQUENCE book_sequence
  MINVALUE 1
  MAXVALUE 999999999
  START WITH 4
  INCREMENT BY 1
  CACHE 20;
  
--SELECT nextval('book_sequence');
  
INSERT INTO public.book
(id, title)
VALUES
(nextval('book_sequence'), 'Lord of the Rings');
  
SELECT *
FROM public.book;

DELETE FROM public.book
WHERE title = 'Lord of the Rings';

DROP VIEW IF EXISTS "vw_book_author";
  
CREATE VIEW public.vw_book_author
 AS
SELECT B.title, BP.year_of_publish, A.author_name, A.date_of_birth
FROM public.book AS B
INNER JOIN public.book_publish AS BP
ON BP.book_id = B.id
INNER JOIN public.book_author AS BA
ON BA.book_publish_id = BP.id
INNER JOIN public.author AS A
ON BA.author_id = A.id;

SELECT *
FROM public.vw_book_author;

DROP VIEW IF EXISTS "vw_admins";

CREATE VIEW public.vw_admins
 AS
SELECT *
FROM public.user AS U
WHERE U.role_id = '1';

SELECT *
FROM public.vw_admins;