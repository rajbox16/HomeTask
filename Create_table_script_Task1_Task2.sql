
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

----------------Table TRAVELS----------------------

-- Table: public.TRAVELS

-- DROP TABLE public.TRAVELS;

CREATE TABLE public.TRAVELS
(
travelId integer,
employeeId integer,
process character varying(45),
byEmployee integer,
country character varying(45),
startDate date,
endDate date,
 PRIMARY KEY (travelId),
 FOREIGN KEY (employeeId) REFERENCES EMPLOYEE (employeeId)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.TRAVELS
    OWNER to postgres;

-- Index: idx_TRAVELS_startDate

-- DROP INDEX public.idx_TRAVELS_startDate;

CREATE INDEX idx_startDate
    ON public.TRAVELS (startDate);
	
----------------Table ATTENDANCE----------------------

-- Table: public.ATTENDANCE

-- DROP TABLE public.ATTENDANCE;

CREATE TABLE public.ATTENDANCE
(
attendanceId integer,
employeeId integer,
date date,
office integer,
floor integer,
tab character varying(2),
PRIMARY KEY (attendanceId),
FOREIGN KEY (employeeId) REFERENCES EMPLOYEE (employeeId)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.ATTENDANCE
    OWNER to postgres;

-- Index: idx_ATTENDANCE_Date

-- DROP INDEX public.idx_ATTENDANCE_Date;

CREATE INDEX idx_Date
    ON public.ATTENDANCE (date);
	