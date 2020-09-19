-- Table: public.todo

-- DROP TABLE public.todo;

CREATE TABLE public.todo
(
    id integer NOT NULL,
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    done boolean NOT NULL,
    expire timestamp without time zone,
    lid integer,
    CONSTRAINT todo_pkey PRIMARY KEY (id),
    CONSTRAINT fk_to_list FOREIGN KEY (lid)
        REFERENCES public.todolist (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public.todo
    OWNER to postgres;
-- Index: fki_fk_to_list

-- DROP INDEX public.fki_fk_to_list;

CREATE INDEX fki_fk_to_list
    ON public.todo USING btree
    (lid ASC NULLS LAST)
    TABLESPACE pg_default;
