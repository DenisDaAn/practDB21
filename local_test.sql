CREATE EXTENSION file_fdw;
SELECT * FROM pg_extension;
CREATE SERVER file_server FOREIGN DATA WRAPPER file_fdw;
CREATE FOREIGN TABLE t1 (x INTEGER, y INTEGER) SERVER file_server_07
	OPTIONS (filename '/home/postgres/app/lab21/data.csv', format 'csv');
CREATE EXTENSION postgres_fdw;
SELECT + FROM pg_extension;
CREATE SERVER test_server_07 FOREIGN DATA WRAPPER postgres_fdw
	OPTIONS (host '127.0.0.1', port '5433', dbname 'remote_test');
CREATE USER MAPPING FOR postgres" SERVER test_server_07
	OPTIONS(user ‘postgres’, password '');

CREATE FOREIGN TABLE t2_on_remote (a INTEGER, b INTEGER) server test_server
	OPTIONS (schema_name ‘public’, table_name 't2');
SELECT * FROM t2_on_remote;
UPDATE t2_on_remote SET b = a * 4;
CREATE SCHEMA test;
IMPORT FOREIGN SCHEMA sch_07 FROM SERVER test_server_07 INTO test;
SELECT * FROM test.t3 UNION SELECT * FROM test.ta;
CREATE EXTENSION dblink;
CREATE VIEW vt2_on_remote AS (
SELECT mya, myb FROM dbLink(
*dbname=remote_test port=5433 host=127.0.0.1 user=postgres passwor
"SELECT a, b FROM t2'
) AS sometab (mya INTEGER, myb INTEGER);
EXPLAIN ANALYZE SELECT * FROM t2_on_remote;
EXPLAIN ANALYZE SELECT * FROM vt2_on_remote;
EXPLAIN ANALYZE SELECT * FROM vt2_m_on_remote;
SELECT * FROM FROM vt2_m_on_remote;


DROP MATERIALIZED VIEW vt2_m_on_remote;
DROP VIEW vt2_on_remote;

DROP FOREIGN TABLE t1;
DROP FOREIGN TABLE t2_on_remote;

DROP SCHEMA test CASCADE;

DROP USER MAPPING FOR "postgres" SERVER test_server_07;
DROP USER MAPPING FOR "user" SERVER test_server_07;
DROP ROLE "user";

DROP SERVER test_server_07;
DROP SERVER file_server;

DROP EXTENSION file_fdw;
DROP EXTENSION postgres_fdw;
DROP EXTENSION dblink;

SELECT * FROM pg_extension;
