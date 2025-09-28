CREATE SCHEMA stg;
CREATE SCHEMA ods;
CREATE SCHEMA dm;

CREATE TABLE ods.fct_earthquake
(
    time varchar,
    latitude varchar,
    longitude varchar,
    depth varchar,
    mag varchar,
    mag_type varchar,
    nst varchar,
    gap varchar,
    dmin varchar,
    rms varchar,
    net varchar,
    id varchar,
    updated varchar,
    place varchar,
    type varchar,
    horizontal_error varchar,
    depth_error varchar,
    mag_error varchar,
    mag_nst varchar,
    status varchar,
    location_source varchar,
    mag_source varchar
)

select * from ods.fct_earthquake 


CREATE TABLE dm.fct_count_day_earthquake AS
SELECT 
	time::DATE as date,
	COUNT(*)
FROM ods.fct_earthquake 
WHERE time::DATE = '2025-06-01'
GROUP BY 1

CREATE TABLE dm.fct_avg_day_earthquake AS
SELECT 
	time::DATE as date,
	AVG(mag::FLOAT)
FROM ods.fct_earthquake
WHERE time::DATE = '2025-06-01'
GROUP BY 1