use ecommerce;

-- task 7 --
create table Customers (customer_id int primary key,name varchar(100),city varchar(50));
create table Orders(order_id int primary key, customer_id int, product_name varchar(100),amount decimal(10,2));
insert into Customers (customer_id, name, city) values
(1, 'Riya Singh', 'Pune'),
(2, 'Aarav Mehta', 'Surat'),
(3, 'Priya Jain', 'Mumbai'),
(4, 'Karan Patel', 'Jaipur');
insert into orders (order_id, product_name, amount) values
(101, 1, 'Laptop', 55000.00),
(102, 2, 'Smartphone', 20000.00),
(103, 3, 'Headphones', 3000.00),
(104, 4,  'Tablet', 15000.00);
create view customer_summary as select c.customer_id, c.name, COUNT(o.order_id) as total_orders,
SUM(o.amount) as total_spent from Customers c left join Orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name;
select * from customer_summary;
create view public_customer_info as select customer_id, name, city from Customers;
select * from public_customer_info;
create view pune_customers as select customer_id, name, city from Customers where city = 'Pune';
select * from pune_customers;

-- task 8 --
DELIMITER //
CREATE PROCEDURE GetOrdersByCustomer(IN cust_id INT)
BEGIN
    SELECT * FROM Orders
    WHERE customer_id = cust_id;
END //

DELIMITER ;
CALL GetOrdersByCustomer(1);
DELIMITER //

CREATE FUNCTION TotalSpent(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT SUM(amount) INTO total FROM Orders WHERE customer_id = cust_id;

    RETURN total;
END //

DELIMITER ;
SELECT TotalSpent(1) AS customer_total;
