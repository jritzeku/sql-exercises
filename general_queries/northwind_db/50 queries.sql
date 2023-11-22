use northwind;
/*
1.) Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.

select 
	categoryName,
    description
from 
	categories
order by
	categoryName
*/

 
/*
3.) Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname
respectively and HireDate from the employees table sorted from the newest to the oldest employee.


 select 
	upper(firstName) as firstName, upper(lastName) as lastName, hireDate 
 from
	employees
 order by hireDate
 

*/

 
 

 /*
5.)Create a report that shows all the CustomerID in lowercase letter and renamed as ID from
 the customers table.
 
  select lower(customerId) as ID 
 from customers
 */
 
 

 /*
 7.) Create report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
 
  
 select companyName, contactName 
 from employees 
 */
 
 
 /*
 9.)Create report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
 
 select productName ,unitPrice, quantityPerUnit , unitsInStock
 from products
 where unitsInStock =0
 
 
 */
 
 
 
 /*
 11.)Create report showing FirstName, LastName, Country from the employees not from United States.
 
  select firstName, lastName, country 
 from employees
 where country <> 'USA'
 
 
 */
 
 
 /*
 13.)Create report that shows the City, CompanyName, ContactName of customers from cities
 starting with A or B.
 
select city,companyName, contactName 
from customers
where city like 'A%' or city like 'B%'
 */

 
 /*
 15.)Create report that shows all the orders where the freight cost more than $500. 
 
  select *
 from orders
 where freight > 500
 
 */
 
 
 
 /*
 17.)Create report that shows the CompanyName, ContactName number of all customer that 
 have no fax number.
 
  select companyName, contactName ,fax
 from customers 
 where fax is null
 
 
 */
 
 
 
 
 /*
 19.)Create report showing all the odd numbers of OrderID from the orders table.
 
  select orderId
 from orders
 where mod(orderId,2)=1
 
 */
 
 /*
 21.) Create a report that shows the City, CompanyName, ContactName of customers from cities that
 has letter L in the name sorted by ContactName.
 
 
  select city, companyName, contactName
 from customers
 where city like "%L%"
 order by contactName
 
 
 */
 
 
 
 
 /*
 23.) Create report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
  select firstName, lastName, extract(year from birthDate) as birthYear 
 from employees
 
 
 */
 
 
 /*
 25.) Create report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids,
Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID

 select s.supplierId, p.productName, s.companyName 
 from suppliers s
 join products   p
 on p.supplierId = s.supplierId
 where s.companyName in  ('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
 order by s.supplierId

 */
 
 

 
 /*
 
 27.) Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their
ContactTitle.

 select  ContactName, ContactTitle, CompanyName
 from customers 
 where contactTitle NOT like "%Sales%"
 

 */
 
 
 
 /*
 29.)Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other
cities in Spain other than Madrid.

 select companyName, contactTitle, city, country 
 from customers 
 where country in ('Mexico' ,'Spain')
 and city <> 'Madrid'
 */
 
 
 /*
 31.)Create a report that shows the ContactName of all customers that do not have letter A as the second 
 alphabet in their Contactname.
 
 select contactName
from  customers
where contactName NOT like "_A%";
 
 

 */
 
 
 /*
 32.) Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock 
 and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
 
  select round (avg (UnitPrice),0) AS AveragePrice, SUM(UnitsInStock) AS TotalStock, max(UnitsOnOrder) as MaxOrder
from  products;
 */
 
 
 
 
 