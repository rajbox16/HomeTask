1. Write CREATE TABLE statement for table EMPLOYEE based on sample data;
----------------Table EMPLOYEE----------------------

-- Table: public.EMPLOYEE


-- DROP TABLE public.EMPLOYEE;

CREATE TABLE public.EMPLOYEE
(
    employeeId integer ,
    name character varying(45) NOT NULL,
    surname character varying(45),
	personalCode character varying(45) NOT NULL,
    startDate date,
    CONSTRAINT EMPLOYEE_pkey PRIMARY KEY (employeeId)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.EMPLOYEE
    OWNER to postgres;

-- Index: idx_EMPLOYEE_name

-- DROP INDEX public.idx_EMPLOYEE_name;

CREATE INDEX idx_name
    ON public.EMPLOYEE USING btree
    (name COLLATE pg_catalog."default")
    TABLESPACE pg_default;

2. Employee named Valentīna Konfekte (140200-22221) is starting next monday. Insert this
information into EMPLOYEE table;

--Insert data in Table EMPLOYEE

insert into EMPLOYEE (
    employeeId,name,surname,
	personalCode,startDate
) VALUES
(1,'Alberts','Keda','310172-11223','2021-01-14'),
(2,'Sniedze','Ieviņa','280282-22133','2021-02-10'),
(3,'Tīna','Zibens','310392-33211','2021-02-11'),
(4,'Valentīna','Konfekte','140200-22221','2022-02-21'),

3. Calculate the average request (of traveling) count per employee since the policy has been
introduced;

select 
ee.employeeId,
ee.name,
ee.surname,
avg(tt.count_travelid)::numeric(10,2) as average_request_travelling

from employee ee
join (select employeeId, sum(byemployee) as count_travelid from travels group by employeeId) tt on tt.employeeId = ee.employeeId
GROUP BY ee.name,
ee.surname,
ee.employeeId

OR


select 
ee.employeeId,
ee.name,
ee.surname,
avg(byemployee)::numeric(10,2) as count_travelid 
from employee ee
INNER JOIN travels tt on tt.employeeId = ee.employeeId
group by ee.employeeId,
ee.name,
ee.surname

4. Calculate how often an employee got rejected for a request to work from elsewhere
during up until now;

select 
ee.employeeId,
ee.name,
ee.surname,
tt.count_travelid::numeric(10,2) as rejected_travelling
from employee ee
join (select employeeId, count(travelid) as count_travelid from travels where process = 'rejected' group by employeeId) tt on tt.employeeId = ee.employeeId

5. Calculate (what currently looks like) top 10 countries by all employees in year 2022;
(note: “currently” as year is not yet over)

Select Country, CountryCount
From (Select country, count(*) CountryCount
      From travels
	  where to_char(startdate, 'yyyy') = '2022' 
      Group By country) z
Order By CountryCount desc 
limit 10

6. Calculate average length of approved travel in each country;

SELECT country,round(avg(enddate::date - startdate::date),2) AS average_length_approved_travel
From travels
where process = 'approved'
group by country

7. Find all employees who haven’t used the opportunity to work from another country and
currently also haven’t requested any travel dates;

select 
ee.employeeId,
ee.name,
ee.surname,
COALESCE(tt.employeeId::text, 'Not used opportunity to work from another country or applied') as workplace
from employee ee
left JOIN travels tt on tt.employeeId = ee.employeeId
where
tt.employeeId isnull

8. List all employees who have approved travel during the same time to the same
destination;

select  
ee.employeeId,
ee.name,
ee.surname,
dups.startdate,
dups.enddate,
dups.country
from (
SELECT employeeid,
startdate,enddate, country,
count(1)over(partition by startdate,enddate, country) as CountDup
  FROM TRAVELS
	where process = 'approved'
) dups
join employee ee on dups.employeeId = ee.employeeId
where 
dups.CountDup > 1
order by dups.startdate,dups.enddate, dups.country asc

9. List each employee and their location on their birthday. If the birthday falls on a
weekend, the value should be just “Weekend”.

select 
ee.employeeId,
ee.name,
ee.surname,
ee.birthdate,
 CASE
 WHEN 
  (CASE
    WHEN to_char(ee.birthdate,'MM-DD') between to_char(tt.startdate,'MM-DD') and to_char(tt.enddate,'MM-DD')
    THEN  extract(dow from ee.birthdate) 
	  END ) = 0  THEN 'Weekend'
 WHEN 
  (CASE
    WHEN to_char(ee.birthdate,'MM-DD') between to_char(tt.startdate,'MM-DD') and to_char(tt.enddate,'MM-DD')
    THEN  extract(dow from ee.birthdate) 
	  END ) = 6  THEN 'Weekend'	  
	else to_char(ee.birthdate, 'Day') 
	end AS locationday,
tt.startdate,
tt.enddate,
tt.country
from(
select 
employeeId,
name,
surname,
TO_DATE(CONCAT(substring(personalcode,0,3), '-', substring(personalcode,3,2), '-', substring(personalcode,5,2)),'DD-MM-yy') as birthdate
from employee
) ee
join TRAVELS tt on tt.employeeId = ee.employeeId
where 1=1
and to_char(ee.birthdate,'MM-DD') between to_char(tt.startdate,'MM-DD') and to_char(tt.enddate,'MM-DD')
and process = 'approved'
order by ee.employeeId

10. List all employees with their preferred method of work - from the office, from home or
work from another country

select distinct on (employeeId) employeeId, office
from ATTENDANCE
group by office, employeeId
order by employeeId, count(*) desc

OR 

select employeeId,office, count(*) as total
from ATTENDANCE s
group by employeeId,office
having count(*) = (
                    select count(*)
                    from ATTENDANCE
                    where employeeId = s.employeeId
                    group by employeeId,office
                    order by count(*) desc
					limit 1
                  )


---------------------------------------

select * from employee
select * from TRAVELS
select * from ATTENDANCE