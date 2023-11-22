-- https://www.w3resource.com/sql-exercises/hospital-database-exercise/sql-exercise-on-hospital-database.php


 
/*
NOTES:
-You must use GROUP BY when using aggregate functions like COUNT() in Select statement
	->https://stackoverflow.com/questions/43481869/aggregated-query-without-group-by

-Subqueries can often be REPLACEd with joins; when it is possible
you shoudl do so
	->https://learnsql.com/blog/converting-subqueries-joins/#:~:text=However%2C%20in%20some%20cases%20a,to%20solve%20a%20data%20question.

    
-When using GROUP BY, it seems we must group by all items in the select statement
	->ex:
		-this results in bug:
        
        select  
			blockfloor as "Floor",
			blockcode as "Block",
		count(*) as "Number of available rooms"
		from 
			room 
		where 
			unavailable = 'false'
		group by
			blockfloor
		order by blockfloor

	
    
		-this fixes it:
        SELECT blockfloor AS "Floor",
			blockcode AS "Block",
			count(*) "Number of available rooms"
		FROM room
		WHERE unavailable='false'
		GROUP BY blockfloor,
			blockcode
		ORDER BY blockfloor,
			blockcode;
        

        
*/
/*
1.) Write a SQL query to find out which nurses have not yet been registered. Return all the fields of nurse table.

 
select * from nurse
where registered = 'false' #or  registered = 0
*/


/*
2.) write a SQL query to identify the nurses in charge of each department. 
Return nursename as “name”, Position as “Position”.


select name as "name", position as "position"
from nurse
where position = 'Head Nurse'

*/

 

/*
3.)  write a SQL query to identify the physicians who are the department heads. Return Department name 
as “Department” and Physician name as “Physician”.
	->notice here we use alias to avoid name conflict since both have 'name' as field 


select 
	p.name as "Physician",
    d.name as "Department"
from 
	department d, 
    physician p
where head = employeeid

*/


/*
4.)write a SQL query to count the number of patients who scheduled an appointment with at least one physician.
 Return count as "Number of patients taken at least one appointment".
 
 select count(distinct patient) as "Number of patients taken at least one appointment"
 from appointment
 
*/

/*
5.) write a SQL query to locate the floor and block where room number 212 is located. 
Return block floor as "Floor" and block code as "Block".

select BlockFloor as "Block" , BlockCode as "Code"
from room 
where roomNumber = 222

*/

 /*
 7.) write a SQL query to count the number of unavailable rooms. 
 Return count as "Number of unavailable rooms".
 
 
select count(*)
 from room
 where unavailable = true
 
 
 */
 
/*
8.)  write a SQL query to identify the physician and the department with which he or she 
is affiliated. Return Physician name as "Physician", and department name as "Department".

	->tables : physician, department, affiliated_with
    
select 
	p.name as "Physician",
	d.name as "Department"
from 
	physician p,
	department d,
	affiliated_with a
where
	p.employeeid = a.physician
and 
	a.department = d.departmentid
    

//ALT. solution (inner join by default) 

SELECT p.name AS "Physician",
       d.name AS "Department"
FROM physician p
JOIN affiliated_with a ON p.employeeid = a.physician
JOIN department d ON a.department = d.departmentid;


*/



/*
9.)write a SQL query to find those physicians who have received special training. 
Return Physician name as “Physician”, treatment procedure name as "Treatment".
	->tables: physician, procedure, trained_in
    
select 
	p.name as "Physician",
    proc.name as "Treatment"

from 
	physician p,
	procedures proc,
	trained_in t
where 
	t.physician = p.employeeid
and 
	t.treatment = proc.code 
 
 
    
*/



/*. 
10.)  write a SQL query to find those physicians who are yet to be affiliated. Return 
Physician name as "Physician", Position, and department as "Department".

SELECT p.name AS "Physician",
       p.position,
       d.name AS "Department"
FROM physician p
JOIN affiliated_with a ON a.physician=p.employeeid
JOIN department d ON a.department=d.departmentid
WHERE primaryaffiliation='false';
 
*/

 /*
 12.) write a SQL query to find the patients with their physicians by whom they received preliminary
 treatment. Return Patient name as "Patient", address as "Address" and Physician name as "Physician".
	->tables: patient, physician
		-NOTE:  in Patient table, 'pcp' field  refers to physician id
        
 SELECT 
	p.name AS "Physician",
    patient.name as "Patient",
    patient.address as "Address"
    
FROM 
    patient
JOIN
	physician p
ON 
	patient.pcp = p.employeeid
 
 */
 
 
 /*
 13.) write a SQL query to identify the patients and the number of physicians with whom they have 
 scheduled appointments. Return Patient name as "Patient", number of Physicians
 as "Appointment for No. of Physicians".
	->tables: patient, physician
	->make sure no empty space between 'count'  and parenthesis
    
SELECT p.name "Patient",
	count(t.patient) "Appointment for No. of Physicians" 
FROM appointment t
JOIN patient p ON t.patient=p.ssn
GROUP BY p.name
 
 */
 
 
 /*
 14.)write a SQL query to count the number of unique patients who have been scheduled for examination 
 room 'C'. Return unique patients as "No. of patients got appointment for room C".
 
 select  count( a.patient) as "No. of patients got appointment for room C"
 from appointment a
 where examinationroom ='C'

 
 */
 
 
 
 /*
 15.) write a SQL query to find the names of the patients and the room number where they need to be 
 treated. Return patient name as "Patient", examination room as "Room No.", and starting date time
 as Date "Date and Time of appointment".
	->tables: patient, appointment, 
    

select
	p.name as "Patient",
    a.examinationroom as "Room no.",
    a.starto  as "Date and Time of appointment"

from 
	patient p
join  
	appointment a
on 
	a.patient = p.ssn
 
    
 */
 
 
/*
16.)write a SQL query to identify the nurses and the room in which they will assist the 
physicians. Return Nurse Name as "Name of the Nurse" and examination room as "Room No.".

	->tables: nurse, appointment 
    
select 
	n.name as  "Name of the Nurse",
    a.examinationroom as "Room No."
 from 
	nurse n
 join 
	appointment a
 on
	n.employeeid = a.prepnurse
 
*/
 
 
 
  
 
/*

17.) write a SQL query to locate the patients who attended the appointment 
on the 25th of April at 10 a.m. Return Name of the patient, Name of the Nurse assisting the 
physician, Physician Name as "Name of the physician", examination room as "Room No.", schedule
 date and approximate time to meet the physician.	
 
	->tables: patient, appointment, nurse, physician 
    
select 
	pat.name as "Name of patient",
    n.name "Name of nurse",
    p.name as "Name of the physician",
    a.examinationroom  as "Room No.",
    a.starto 

from
	patient as pat
join
	appointment as a
on
	a.patient = pat.ssn
join 
	nurse as n
on 
	n.employeeid = a.prepnurse
join
	physician p
on 
	p.employeeid = a.physician
where
	starto = '2008-04-25 10:00:00'
 
 
*/


/*
18.)  write a SQL query to identify those patients and their physicians who do not require any 
nursing assistance. Return Name of the patient as "Name of the patient", Name of the Physician
as "Name of the physician" and examination room as "Room No.".

	->table: patient, appointment, physician 
    
select 
	pat.name as "Name of patient",
    p.name as "Name of the physician",
    a.examinationroom  as "Room No."
from
	patient as pat
join
	appointment as a
on
	a.patient = pat.ssn
join
	physician p
on 
	p.employeeid = a.physician
where 
	a.prepnurse is null

*/


 
    

/*
19.) write a SQL query to locate the patients' treating physicians 
and medications. Return Patient name as "Patient", Physician name as "Physician",
 Medication name as "Medication".
	->tables: patient, prescribe , physician ,medication
    
select 
	pat.name as "Patient",
    p.name as "Physician",
    m.brand  as "Medication"
from
	patient  pat
join 
	prescribes pres
on 
	pres.patient = pat.ssn
join
	 physician p
on
	p.employeeid = pres.physician
join 
	medication m
on 
	m.code =  pres.medication 

 
*/

/*
20.)  write a SQL query to identify patients who have made an advanced appointment.
 Return Patient name as "Patient", Physician name as "Physician" and Medication 
 name as "Medication".
	->tables: patient, prescribe , physician ,medication
    
    
SELECT t.name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.patient=t.ssn
JOIN physician p ON s.physician=p.employeeid
JOIN medication m ON s.medication=m.code
WHERE s.appointment IS NOT NULL;

*/
 


/*
21.) write a SQL query to find those patients who did NOT schedule an appointment.
 Return Patient name as "Patient", Physician name as "Physician" and Medication 
 name as "Medication".
 
	->tables: patient, prescibes, physician, medication 
    
	->solution is SAME as ex 20 except we check for 'IS NULL'
*/



/*
22. write a SQL query to count the number of available rooms in each block. 
Sort the result-set on ID of the block. Return ID of the block as "Block", 
count number of available rooms as "Number of available rooms".

	->tables: room
    
select 
	r.blockcode as "Block",
	count(*) "Number of available rooms" -- 
from 
	room r
where 
	r.unavailable = 'false' 
group by r.blockcode 
order by r.blockcode


 


*/


/*
23.) write a SQL query to count the number of available rooms in each floor. Sort 
the result-set on block floor. Return floor ID as "Floor" and count the number of
available rooms as "Number of available rooms".


select 
	blockfloor as "Floor",
    count(*) as "Number of available rooms"
from
	room
where 
	unavailable = 'false'
group by
	blockfloor

*/

 
 
 
/*
24.) write a SQL query to 
	->count the number of available rooms for each floor in each block
	->Sort the result-set on floor ID, ID of the block.
	->Return the floor ID as "Floor", ID of the block as "Block"
	and number of available rooms  as "Number of available rooms".
    
select  
	blockfloor as "Floor",
	blockcode as "Block",
    count(*) as "Number of available rooms"
from 
	room 
where 
	unavailable = 'false'
group by blockfloor, blockcode
order by blockfloor, blockcode

*/


 
/*
25.) write a SQL query to 
	->count the number of rooms that are unavailable in each block and on each floor.
	->Sort the result-set on block floor, block code. 
	->Return the floor ID as "Floor", block ID as "Block", and number of 
	unavailable as “Number of unavailable rooms".
    

select 
	blockfloor as "Floor",
    blockcode as "Block",
    count(*) as "Number of unavailable rooms"
from 
	room
where 
	unavailable = 'true'
group by
	blockfloor, blockcode
order by 
	blockfloor,
    blockcode 
	
*/

 




/*

26.) write a SQL query to	
	->find the floor where the maximum number of rooms are available. 
	->Return floor ID as "Floor", count "Number of available rooms".
    (HARD!!!)
    
SELECT 
	blockfloor as "Floor",
	count(*) AS  "Number of available rooms"
FROM 
	room
WHERE 
	unavailable='false'
GROUP BY
	blockfloor
HAVING 
	count(*) = (SELECT 
					max(zz) AS highest_total 
				FROM
					(SELECT 
						blockfloor ,
						count(*) AS zz
					FROM
						room
					WHERE 
						unavailable='false'
					GROUP BY
						blockfloor ) AS t );

*/

 
 
 /*
 28.) write a SQL query to 
	->find the name of the patients, their block, floor, and room number where they admitted.
    

select 	
	p.name as "Patient", 
    r.blockcode as "Block",
    r.blockfloor as "Floor",
    r.roomnumber as "Room #"
from 
	patient p
join 
	stay s
on
	s.patient = p.ssn
join 
	room r
on 
	r.roomnumber = s.room
 */
 
 
 

/*
29.)write a SQL query to
	->locate the nurses and the block where they are scheduled to attend the on-call patients.
    ->Return Nurse Name as "Nurse", Block code as "Block".
*/



 

 
 
  

 
 