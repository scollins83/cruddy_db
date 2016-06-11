-- Function: public.cruddy_create_sample(character varying, text, timestamp with time zone)

-- DROP FUNCTION public.cruddy_create_sample(character varying, text, timestamp with time zone);

CREATE OR REPLACE FUNCTION public.cruddy_create_sample(
    name character varying,
    descr text,
    effdt timestamp with time zone DEFAULT transaction_timestamp())
  RETURNS integer AS
$BODY$DECLARE active_row_id integer := -1;
DECLARE active_row_count integer := 0;
BEGIN
	-- See if any identical rows already exist that are active
	EXECUTE 'SELECT count(*) FROM cruddy_sample_table
		                 WHERE sample_name = ''' || name ||
                                 ''' AND sample_description = ''' || descr ||
                                 ''' AND eff_dt_status_key = 1' INTO active_row_count;

	IF active_row_count = 0 THEN
		EXECUTE 'INSERT INTO cruddy_sample_table(sample_name, sample_description,
                         sample_created, last_updated, effdt, eff_dt_status_key) VALUES
                         (''' || name || ''', ''' || descr
			   || ''',''' || transaction_timestamp() ||
                          ''',''' || transaction_timestamp() || ''',''' || effdt ||
                          ''',' || 1 || ');';
                EXECUTE 'SELECT sample_table_id FROM cruddy_sample_table
		         WHERE sample_name = ''' || name ||
                        ''' AND sample_description = ''' || descr ||
                        ''' AND eff_dt_status_key = 1' INTO active_row_id;
                RETURN active_row_id;
        ELSE
		EXECUTE 'SELECT sample_table_id FROM cruddy_sample_table
		                 WHERE sample_name = ''' || name ||
                                 ''' AND sample_description = ''' || descr ||
                                 ''' AND eff_dt_status_key = 1
                                  ORDER BY effdt desc
                                  LIMIT 1' INTO active_row_id;

                RETURN active_row_id;
        END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
COMMENT ON FUNCTION public.cruddy_create_sample(character varying, text, timestamp with time zone) IS 'Function template for crud create';
