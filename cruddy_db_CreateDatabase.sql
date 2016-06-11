-- Database: cruddy_db

-- DROP DATABASE cruddy_db;

CREATE DATABASE cruddy_db
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'C'
       LC_CTYPE = 'C'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE cruddy_db
  IS 'Basic database for making a CRUD template for later reuse. ';
