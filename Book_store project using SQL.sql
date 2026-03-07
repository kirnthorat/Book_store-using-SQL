CREATE TABLE Books(			
	Book_ID	SERIAL	Primary key,
	Title	VARCHAR(100),	
	Author	VARCHAR(100),	
	Genre	VARCHAR(50),
	Published_Year	INT,	
	Price	NUMERIC(10,2),	
	Stock	INT			
);



CREATE TABLE customers(
    Customer_ID SERIAL primary key,
    Name VARCHAR(50),
	Email VARCHAR(50),
	Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);


SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

---copy books data
---copy customers data
---copy order data

--Q1 retrive all books in the 'fiction' genre
SELECT * FROM books
WHERE genre= 'Fiction';

--Q2 find books published after the year 1950
SELECT * FROM books
WHERE published_year >1950;

--Q3 list all customers from the canada
SELECT * FROM customers
WHERE country ='anada';

--Q4 show orders placed in november 2023
SELECT * FROM orders
WHERE order
--Q5 retrive the total stock of books available
SELECT SUM(stock) AS stock_avaliable FROM books; 

--Q6 find the details of the most expensive book
SELECT * FROM books
ORDER BY price DESC
LIMIT 1;

--Q7 show all customers who ordered more than 1 quantity of book
SELECT * FROM orders
WHERE quantity >1;

--Q8 retrive all orders where the total amount exceeds $20
SELECT * FROM orders
WHERE total_amount >20;

--Q9 list all genres available in books table
SELECT DISTINCT genre,stock
FROM books
WHERE stock >0;

--Q10 find the book with the lowest stock 
SELECT * FROM books
ORDER BY stock 
LIMIT 1;

--Q11 calculate the total revenue generated from all orders
SELECT SUM(total_amount) FROM orders;

--Q12 retrive the total number of books sold for each genre
SELECT b.genre,SUM(o.quantity)
FROM orders o
JOIN 
books b ON o.book_id = b.book_id
GROUP BY genre;

--Q13 find the average price of books in the 'fantasy' genre
SELECT AVG (price) FROM books
WHERE genre ='Fantasy';

--Q13 list customers who have placed at least 2 orders
SELECT customer_id, COUNT(order_id) AS sold FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >2;

SELECT c.name, o.customer_id, COUNT(o.order_id) AS sold
FROM orders o
join 
customers c ON c.customer_id = o.customer_id 
GROUP BY o.customer_id , c.name
HAVING COUNT(o.order_id) >2;

--Q14 find the most frequently ordered book
SELECT b.genre, o.book_id, COUNT(o.book_id) AS book_order
FROM orders o
JOIN 
books b ON b.book_id = o.book_id
GROUP BY o.book_id , b.genre
ORDER by book_order DESC
LIMIT 1;

SELECT book_id,COUNT(book_id) AS book_order
FROM orders
GROUP BY book_id
ORDER BY book_order
LIMIT 1;

--Q15 show the top 3 most expensive books of 'fantasy' genre
SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC
LIMIT 3;

--Q16 retrive the total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS total_sold
FROM books b
JOIN 
orders o ON b.book_id = o.book_id
GROUP BY b.author;

--Q17 list the cities when customers who spent over $30 are located
SELECT c.city, o.total_amount
FROM customers c
JOIN 
orders o ON c.customer_id = o.customer_id
WHERE o.total_amount>30;

--Q18 find the customers who spent the most on orders
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spend
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.name,c.customer_id
ORDER BY total_spend DESC;

--Q19 calculate the stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(quantity),0) AS order_quantity,
 b.stock- COALESCE(SUM(quantity),0) AS remaining_quantity 
FROM books b
LEFT JOIN 
orders o ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY b.book_id;

