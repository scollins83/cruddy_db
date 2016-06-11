-- Table: public.cruddy_sample_table

-- DROP TABLE public.cruddy_sample_table;

CREATE TABLE public.cruddy_sample_table
(
  sample_table_id integer NOT NULL DEFAULT nextval('cruddy_sample_table_sample_table_id_seq'::regclass),
  sample_name character varying(255) NOT NULL,
  sample_description text,
  sample_created timestamp with time zone,
  last_updated timestamp with time zone,
  effdt timestamp with time zone NOT NULL,
  eff_dt_status_key integer NOT NULL, -- Foreign key to effective date status table
  CONSTRAINT cruddy_sample_table_pk PRIMARY KEY (sample_table_id),
  CONSTRAINT cruddy_effdtstatus_fk FOREIGN KEY (eff_dt_status_key)
      REFERENCES public.cruddy_effdtstatus (eff_dt_status_key) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.cruddy_sample_table
  OWNER TO postgres;
COMMENT ON COLUMN public.cruddy_sample_table.eff_dt_status_key IS 'Foreign key to effective date status table';

