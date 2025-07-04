# Task-8-Stored-Procedures-and-Functions

# Task 8: Stored Procedures and Functions

# Objective
Learn to modularize and reuse SQL logic using stored procedures and functions in MySQL.

# Tools Used
- MySQL Workbench

This task demonstrates how to:
- Use `CREATE PROCEDURE` to define blocks of SQL logic for repeated execution.
- Use `CREATE FUNCTION` to return computed values.

# 1. Created a Stored Procedure: `GetOrdersByCustomer`
-This procedure retrieves all orders placed by a specific customer based on their ID.
DELIMITER //
CREATE PROCEDURE GetOrdersByCustomer(IN cust_id INT)
BEGIN
    SELECT * FROM Orders
    WHERE customer_id = cust_id;
END //

DELIMITER ;

- To call the procedure
  CALL GetOrdersByCustomer(1);

- create a function that returns the total amount a customer has spent.
DELIMITER //
CREATE FUNCTION TotalSpent(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT SUM(amount) INTO total
    FROM Orders
    WHERE customer_id = cust_id;

    RETURN total;
END //
DELIMITER ;

-SELECT TotalSpent(1) AS customer_total;

