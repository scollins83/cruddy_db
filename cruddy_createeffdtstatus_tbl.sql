-- Table: public.cruddy_effdtstatus

-- DROP TABLE public.cruddy_effdtstatus;

CREATE TABLE public.cruddy_effdtstatus
(
  eff_dt_status_key integer NOT NULL DEFAULT nextval('cruddy_effdtstatus_eff_dt_status_key_seq'::regclass),
  eff_dt_code "char" NOT NULL, -- code
  eff_dt_desc text,
  effdt_created timestamp with time zone,
  CONSTRAINT crud_effdtstatus_pk PRIMARY KEY (eff_dt_status_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.cruddy_effdtstatus
  OWNER TO postgres;
COMMENT ON COLUMN public.cruddy_effdtstatus.eff_dt_code IS 'code';

