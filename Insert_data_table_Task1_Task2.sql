

--Insert data in Table EMPLOYEE

insert into EMPLOYEE (
    employeeId,name,surname,
	personalCode,startDate
) VALUES
(1,'Alberts','Keda','310172-11223','2021-01-14'),
(2,'Sniedze','Ieviņa','280282-22133','2021-02-10'),
(3,'Tīna','Zibens','310392-33211','2021-02-11'),
(4,'Valentīna','Konfekte','140200-22221','2022-02-21'),
(5,'Raj','Mang','140210-22271','2022-02-05')



--Insert data in Table TRAVELS

insert into TRAVELS (
travelId,
employeeId,
process,
byEmployee,
country,
startDate,
endDate 
) 

VALUES
(1,2,'approved',1,'Estonia','2022-01-02','2022-01-31'),
(2,3,'approved',1,'Spain','2021-12-12','2022-01-12'),
(3,3,'rejected',1,'Greece','2022-01-30','2022-02-14'),
(4,4,'approved',1,'Lithuania','2022-01-04','2022-01-31'),
(5,4,'approved',1,'Spain','2021-12-16','2022-01-12'),
(6,1,'rejected',1,'spain','2022-01-20','2022-02-10'),
(7,1,'approved',1,'Estonia','2022-01-02','2022-01-31'),
(8,2,'approved',1,'Estonia','2022-02-01','2022-02-05'),
(9,2,'rejected',1,'Finland','2022-02-11','2022-02-15'),
(10,3,'approved',1,'Spain','2022-02-07','2022-02-10'),
(11,3,'rejected',1,'Greece','2022-02-11','2022-02-15'),
(12,4,'approved',1,'Lithuania','2022-02-01','2022-02-05'),
(13,4,'approved',1,'Spain','2022-02-11','2022-02-15'),
(14,1,'rejected',1,'spain','2022-02-07','2022-02-10'),
(15,1,'approved',1,'Estonia','2022-02-11','2022-02-15')

--Insert data in Table ATTENDANCE


insert into ATTENDANCE
(
attendanceId,
employeeId,
date,
office,
floor,
tab
) 

VALUES
(1,1,'2022-01-03',1,3,'G1'),
(2,1,'2022-01-04',1,3,'G1'),
(3,1,'2022-01-05',0,0,''),
(4,2,'2022-01-03',1,3,'G1'),
(5,2,'2022-01-04',1,3,'G1'),
(6,2,'2022-01-05',0,0,''),
(7,3,'2022-01-03',1,3,'G1'),
(8,3,'2022-01-04',1,3,'G1'),
(9,3,'2022-01-05',0,0,''),
(10,4,'2022-01-03',1,3,'G1'),
(11,4,'2022-01-04',1,3,'G1'),
(12,4,'2022-01-05',0,0,'')
