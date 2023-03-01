CREATE TABLE Vendor (
  Vendor_id INT PRIMARY KEY,
  Vendor_name VARCHAR(50),
  Vendor_phone VARCHAR(20)
);

CREATE TABLE Product (
  Product_id INT PRIMARY KEY,
  Product_name VARCHAR(50),
  Product_price DECIMAL(8,2)
);

CREATE TABLE Supply (
  Supply_id INT PRIMARY KEY,
  Product_id INT,
  Vendor_id INT,
  Quantity INT,
  FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
  FOREIGN KEY (Vendor_id) REFERENCES Vendor(Vendor_id)
);

INSERT INTO Vendor (Vendor_id, Vendor_name, Vendor_phone) VALUES
  (1, 'fruty Grocers', '90930009'),
  (2, 'epic Grocers', '98393933');

INSERT INTO Product (Product_id, Product_name, Product_price) VALUES
  (1, 'Apples', 1.99),
  (2, 'Bananas', 0.99);

INSERT INTO Supply (Supply_id, Product_id, Vendor_id, Quantity) VALUES
  (1, 1, 1, 100),
  (2, 2, 1, 50),
  (3, 1, 2, 75),
  (4, 2, 2, 100);

  -- Q7
SELECT * FROM Vendor;


-- Q8 

SELECT * FROM Vendor WHERE Vendor_city = 'New York';

-- Q9

-- 10


-- Q11


-- Q12


-- Q13


-- Q14

-- Exercise in percedure 

--

-- Procedure to display all even numbers below 100:
DECLARE @i INT = 0
WHILE @i < 100
BEGIN
    IF @i % 2 = 0
        PRINT @i
    SET @i = @i + 1
END


-- Procedure to display all odd numbers below 100:
CREATE PROCEDURE DisplayOddNumbers
AS
BEGIN
  DECLARE @i INT = 1
  WHILE @i < 100
  BEGIN
    PRINT @i
    SET @i = @i + 2
  END
END

-- //

-- Procedure to display all even numbers below 100:
CREATE PROCEDURE DisplayEvenNumbers
AS
BEGIN
  DECLARE @i INT = 0
  WHILE @i < 100
  BEGIN
    PRINT @i
    SET @i = @i + 2
  END
END
-- Procedure to display all odd numbers below 100:
CREATE PROCEDURE DisplayOddNumbers
AS
BEGIN
  DECLARE @i INT = 1
  WHILE @i < 100
  BEGIN
    PRINT @i
    SET @i = @i + 2
  END
END
-- Procedure to display whether a number is prime or not:
CREATE PROCEDURE CheckIfPrime
  @num INT
AS
BEGIN
  DECLARE @isPrime BIT = 1
  DECLARE @i INT = 2
  WHILE @i <= SQRT(@num)
  BEGIN
    IF @num % @i = 0
    BEGIN
      SET @isPrime = 0
      BREAK
    END
    SET @i = @i + 1
  END
  IF @isPrime = 1
    PRINT @num + ' is a prime number.'
  ELSE
    PRINT @num + ' is not a prime number.'
END
-- Procedure to display the sum of 10 numbers:
CREATE PROCEDURE DisplaySumOfNumbers
AS
BEGIN
  DECLARE @total INT = 0
  DECLARE @i INT = 1
  WHILE @i <= 10
  BEGIN
    DECLARE @num INT
    SET @num = CAST(READ('Enter a number: ') AS INT)
    SET @total = @total + @num
    SET @i = @i + 1
  END
  PRINT 'The sum of the numbers is: ' + CAST(@total AS NVARCHAR(10))
END
-- Procedure to display 20 multiples for all the numbers between 2 given numbers:
CREATE PROCEDURE dbo.Display20Multiples
    @n INT
AS
BEGIN
    DECLARE @i INT = 1
    WHILE @i <= @n
    BEGIN
        DECLARE @j INT = 1
        PRINT 'Multiples of ' + CONVERT(VARCHAR(10), @i) + ':'
        WHILE @j <= 20
        BEGIN
            PRINT CONVERT(VARCHAR(10), @i * @j)
            SET @j = @j + 1
        END
        SET @i = @i + 1
    END
END
-- Procedure to display the reverse of a given number:
CREATE PROCEDURE ReverseNumber
  @num INT
AS
BEGIN
  DECLARE @reversedNum INT = 0
  WHILE @num > 0
  BEGIN
    DECLARE @digit INT = @num % 10
    SET @reversedNum = (@reversedNum * 10) + @digit
    SET @num = @num / 10
  END
  PRINT 'The reverse of the number is: ' + CAST(@reversedNum AS NVARCHAR(10))
END
-- Procedure to display the sum of individual digits of a given number:
CREATE PROCEDURE SumOfDigits
  @num INT
AS
BEGIN
  DECLARE @total INT = 0
  WHILE @num > 0
  BEGIN
    DECLARE @digit INT = @num % 10
    SET @total = @total + @digit
    SET @num = @num / 10
  END
 