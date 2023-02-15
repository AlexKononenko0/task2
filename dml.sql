--This file insert data for any tables from first task.
DELETE FROM public.role;

INSERT INTO public.role (id,name)
VALUES (1, 'admin'),
(2,'client');

DELETE FROM public.author;

INSERT INTO public.author (id,author_name,date_of_birth)
VALUES (1, 'Lev', '28.08.1828'),
(2, 'Jane', '16.12.1775'),
(3, 'Philip', '19.10.1946');

DELETE FROM public.book;

INSERT INTO public.book (id,title)
VALUES (1, 'War and Peace'),
(2, 'Pride and Prejudice'),
(3, 'Dark Beginnings');

DELETE FROM public.book_publish;

INSERT INTO public.book_publish (id,book_id,year_of_publish)
VALUES (1, 1, 1867),
(2, 2, 1813),
(3, 3, 1995);

DELETE FROM public.book_author;

INSERT INTO public.book_author (id,book_publish_id,author_id)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3);

DELETE FROM public.book_count;

INSERT INTO public.book_count (id,book_publish_id,count)
VALUES (1, 1, 3),
(2, 2, 3),
(3, 3, 3);

DELETE FROM public.user;

INSERT INTO public.user (id,name,role_id)
VALUES (1, 'Alex', 1),
(2, 'John', 2),
(3, 'Jason', 2);

DELETE FROM public.order;

INSERT INTO public.order (id,date,user_id)
VALUES (1, '10.07.2022', 1),
(2, '10.08.2022', 2),
(3, '10.09.2022', 3);

