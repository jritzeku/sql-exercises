/*
1.) Employees with Salary Above 35000

	->Instruction 
Create stored procedure usp_get_employees_salary_above_35000 that returns all employees’ first
 and last names for whose salary is above 35000. The result should be sorted by first_name 
 then by last_name alphabetically, and id ascending. Submit your query statement as Run 
 skeleton, run queries & check DB in Judge.
 
 
	->Query 

delimiter $$
create procedure usp_get_employees_salary_above_35000()
begin 
	select 
		e.first_name, e.last_name
	from 
		employees e
	where 
		e.salary > 35000;
	order by
		e.first_name, e.last_name, e.employee_id
 
end$$
delimiter ;
 

    ->Test

call  usp_get_employees_salary_above_35000()
  

*/

 
 
 /*
 2.) Employees with Salary Above Number
 
	->Instruction 
 
 Create stored procedure usp_get_employees_salary_above that accept a number as parameter 
 and return all employees’ first and last names whose salary is above or equal to the 
 given number. The result should be sorted by first_name then by last_name alphabetically 
 and id ascending. Submit your query statement as Run skeleton, run queries & check DB in Judge.
 
	->Query 
    
delimiter $$
create procedure usp_get_employees_salary_above(in amt float)
begin 
	select 
		e.first_name, e.last_name, e.salary
	from 
		employees e
	where 
		e.salary > amt;
	order by
		e.first_name, e.last_name, e.employee_id
end$$
delimiter ;


    ->Test
    
call  usp_get_employees_salary_above(40000.40)
 */
 
 
 /*
 3.) Town Names Starting With
 
	->Instruction 
 
Write a stored procedure usp_get_towns_starting_with that accept string as parameter and 
returns all town names starting with that string. The result should be sorted by town_name
 alphabetically. Submit your query statement as Run skeleton, run queries & check DB in Judge.
 
	->Query 
    
delimiter $$
create procedure usp_get_towns_starting_with(in town varchar(50))
begin 
	select 
		t.name as "town_name"
	from 
		towns t
	where 
		t.name like concat(town,'%')
	order by
		t.name ;
end$$
delimiter ;

	->Test
  
CALL usp_get_towns_starting_with('be'); 

 */
 
 
 /*
 4.) Employees from Town
 
	->Instruction 
    
Write a stored procedure usp_get_employees_from_town that accepts town_name as parameter 
and return the employees’ first and last name that live in the given town. The result 
should be sorted by first_name then by last_name alphabetically and id ascending. Submit
 your query statement as Run skeleton, run queries & check DB in Judge.
 
	->Query

create procedure usp_get_employees_from_town(in town varchar(50))
begin 
	select 
		e.first_name, e.last_name, t.name
	from 
		employees e
	join
		addresses a
	on 
		a.address_id = e.address_id
	join
		towns t
	on 
		t.town_id = a.town_id
	where 
		t.name like concat(town,'%')
	order by
		e.first_name, e.last_name, e.employee_id;
end$$
delimiter ;
  
	->Test
    
call usp_get_employees_from_town('Sofia')
 
 
 */
 
 
 /*
 5.) Salary Level Function
 
	->Instruction 
    
Write a function ufn_get_salary_level that receives salary of an employee and returns the level of the salary.
 
If salary is < 30000 return “Low”
If salary is between 30000 and 50000 (inclusive) return “Average”
If salary is > 50000 return “High”

Submit your query statement as Run skeleton, run queries & check DB in Judge.

	->Query
    
 create function ufn_get_salary_level(salary DOUBLE)
 returns varchar(10)
 return (
 
	case 
		when salary < 30000 then 'Low'
        when salary between 30000 and 50000 then 'Average'
        else 'High'
	end 
 );
 
    

    ->Test
    
SELECT ufn_get_salary_level(13500);  -- low 
SELECT ufn_get_salary_level(35000); -- medium
SELECT ufn_get_salary_level(60000); -- high
    

 */
 
 
 
/*
6.) Employees by Salary Level

	->Instruction 

Write a stored procedure usp_get_employees_by_salary_level that receive as parameter level
f salary (low, average or high) and print the names of all employees that have given level 
of salary. The result should be sorted by first_name then by last_name both in descending order.

	->Query 

 delimiter $$ 
 create procedure usp_get_employees_by_salary_level(salary_level VARCHAR(50))
 begin 
	select
		e.first_name, e.last_name, e.salary
	from 
		employees e 
	where 
		e.salary < 30000 and salary_level = 'low'
        or e.salary between 30000 and 50000 and salary_level ='average'
        or e.salary > 50000 and salary_level='high'
	order by
		e.first_name desc, e.last_name desc;
 end $$ 
 
	->Test

 call  usp_get_employees_by_salary_level('high') 
 
*/
 
 
 
 /*
 8.) Find full name 
 
	->Query 
 
 You are given a database schema with tables:
	-account_holders(id (PK), first_name, last_name, ssn) 
	-accounts(id (PK), account_holder_id (FK), balance).
Write a stored procedure usp_get_holders_full_name that selects the full names of all people. 
The result should be sorted by full_name alphabetically and id ascending.


 use bank; 
 
 delimiter $$ 
 create procedure usp_get_holders_full_name()
 begin 
	select
		concat(ah.first_name, ' ' ,  ah.last_name) as 'full_name'
	from 
		account_holders ah
 
	join
		accounts a
	on	
		a.account_holder_id = ah.id
	order by
		ah.first_name, ah.last_name;
 end $$ 
 


	->Test
    
  
 call  usp_get_holders_full_name();
  
 */
 
 
 
 /*
 9.)People with Balance Higher Than
 
	->Instruction 
 
 Your task is to create a stored procedure usp_get_holders_with_balance_higher_than that accepts a 
 number as a parameter and returns all people who have more money in total of all their accounts 
 than the supplied number.  The result should be sorted by first_name then by last_name alphabetically 
 and account id ascending. 

	->Query

 
DELIMITER $$
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(balance double)
BEGIN
    SELECT 
         ah.first_name, ah.last_name
    FROM
        `account_holders` AS ah
            JOIN
        (SELECT 
            a.id, a.account_holder_id, SUM(a.balance) AS 'total_balance'
        FROM
            `accounts` AS a
        GROUP BY (a.account_holder_id)
        HAVING `total_balance` > balance) as a
        ON 
			ah.id = a.account_holder_id
    ORDER BY a.id;
END $$


	->Test 
 call  usp_get_holders_with_balance_higher_than(45000)

 */
 
 
 /*
 12.) Deposit money
 
	->Instruction 
Add stored procedure usp_deposit_money(account_id, money_amount) that operate in transactions. 
Make sure to guarantee valid positive money_amount with precision up to fourth sign after 
decimal point. The procedure should produce exact results working with the specified precision.


	-> Query 
    
 
 */
 
 
delimiter $$ 
create procedure usp_deposit_money(account_id int, money_amount decimal(19,4))
begin
	if money_amount > 0 then   -- amount validation 
		start transaction; 
        
        update 
			accounts a 
		set 
			a.balance = a.balance + money_amount -- increment balance
		where 
			a.id = account_id;
		if 
			(select a.balance from accounts a
            where a.id= account_id) <  0
			then rollback; -- FAIL! revert tables to previosu state 
		else 
			commit; -- SUCCCESS! commit changes
		end if;
	end if;
end $$
			
    
 
 
 
 
