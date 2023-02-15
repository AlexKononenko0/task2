--This file created all tables from first task.
DROP TABLE IF EXISTS public.book;

CREATE TABLE IF NOT EXISTS public.book
(
    id integer NOT NULL,
    title text NOT NULL,
    CONSTRAINT "book_pkey" PRIMARY KEY (id)
);

DROP TABLE IF EXISTS public.user;

CREATE TABLE IF NOT EXISTS public.user
(
    id integer NOT NULL,
    name text NOT NULL,
    role_id integer NOT NULL,
    CONSTRAINT "user_pkey" PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.user
    ADD CONSTRAINT "FK_user_role" FOREIGN KEY (role_id)
    REFERENCES public.role (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;

DROP TABLE IF EXISTS public.role;

CREATE TABLE IF NOT EXISTS public.role
(
    id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT "role_pkey" PRIMARY KEY (id)
);

DROP TABLE IF EXISTS public.order;

CREATE TABLE IF NOT EXISTS public.order
(
    id integer NOT NULL,
    date date NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY (id),
    CONSTRAINT "FK_order_user" FOREIGN KEY (user_id)
        REFERENCES public.user (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS public.book_publish;

CREATE TABLE IF NOT EXISTS public.book_publish
(
    id integer NOT NULL,
    book_id integer NOT NULL,
    year_of_publish integer NOT NULL,
    CONSTRAINT book_publish_pkey PRIMARY KEY (id),
    CONSTRAINT "FK_book_publish_book" FOREIGN KEY (book_id)
        REFERENCES public.book (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS public.book_order;

CREATE TABLE IF NOT EXISTS public.book_order
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    book_publish_id integer NOT NULL,
    order_id integer NOT NULL,
    cost integer NOT NULL,
    count integer NOT NULL,
    CONSTRAINT book_order_pkey PRIMARY KEY (id),
    CONSTRAINT "FK_book_order_order" FOREIGN KEY (order_id)
        REFERENCES public."order" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "FK_book_publish_book_order" FOREIGN KEY (book_publish_id)
        REFERENCES public.book_publish (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS public.book_count;

CREATE TABLE IF NOT EXISTS public.book_count
(
    id integer NOT NULL,
    book_publish_id integer NOT NULL,
    count integer NOT NULL,
    CONSTRAINT book_count_pkey PRIMARY KEY (id),
    CONSTRAINT "FK_book_count_book_publish" FOREIGN KEY (book_publish_id)
        REFERENCES public.book_publish (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS public.author;

CREATE TABLE IF NOT EXISTS public.author
(
    id integer NOT NULL,
    author_name text COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    CONSTRAINT author_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS public.book_author;


CREATE TABLE IF NOT EXISTS public.book_author
(
    id integer NOT NULL,
    book_publish_id integer NOT NULL,
    author_id integer NOT NULL,
    CONSTRAINT book_author_pkey PRIMARY KEY (id),
    CONSTRAINT "FK_book_author_author" FOREIGN KEY (author_id)
        REFERENCES public.author (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "FK_book_author_book_publish" FOREIGN KEY (book_publish_id)
        REFERENCES public.book_publish (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
