CREATE TABLE "public"."t2" ("a" integer DEFAULT NULL, "b" integer DEFAULT NULL);

INSERT INTO t2 (a, b) VALUES
	(1, 1),
	(2, 4),
	(3, 9),
	(4, 16),
	(5, 25);
SELECT * FROM t2;
INSERT INTO t2 (a, b) VALUES (6, 36);

CREATE SCHEMA sch_07;

CREATE TABLE sch_07.t3 (z INTEGER);
CREATE TABLE sch_07.t4 (w INTEGER);

INSERT INTO sch_07.t3 SELECT 10 + random() * 5 FROM generate_series(1, 5);
INSERT INTO sch_07.t4 SELECT 10 + random() * 5 FROM generate_series(1, 5);
SELECT * FROM sch_07.t3 UNIONT SELECT * FROM sch_07.t4;

DROP TABLE public.t2;

DROP TABLE sch_07;.t3;
DROP TABLE sch_07;.t4;
DROP SCHEMA sch_07;