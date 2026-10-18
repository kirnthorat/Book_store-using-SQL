# 📚 Book Store Database using SQL

A relational database project that manages the data of a book store, including books, authors, customers, orders, and sales. It uses SQL to create the schema, insert data, and answer business questions through queries.

## 📌 Table of Contents
- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Database Schema](#database-schema)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Sample Queries](#sample-queries)
- [Key Insights](#key-insights)
- [Technologies Used](#technologies-used)
- [Author](#author)

## Project Overview
This project designs and implements a database for a book store. It covers database creation, table design with primary and foreign keys, data import, and SQL analysis to get useful insights about inventory, customers, and sales.

## Objectives
- Design a normalized relational database for a book store
- Create tables with proper constraints and relationships
- Load and manage sample data
- Write SQL queries to analyze sales, customers, and inventory

## Database Schema

| Table | Description |
|-------|-------------|
| `Books` | Book ID, title, author, genre, price, stock |
| `Customers` | Customer ID, name, email, phone, city, country |
| `Orders` | Order ID, customer ID, book ID, order date, quantity, total amount |

> Update this table to match the tables in your project.

**Relationships**
- One customer can place many orders
- One book can appear in many orders

## Project Structure
```
Book_store-using-SQL/
│── Books.csv
│── Customers.csv
│── Orders.csv
│── schema.sql        # Table creation
│── queries.sql       # Analysis queries
│── README.md
```
> Rename the files to match your repository.

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/kirnthorat/Book_store-using-SQL.git
   ```
2. **Create the database**
   ```sql
   CREATE DATABASE BookStore;
   USE BookStore;
   ```
3. **Create the tables** by running `schema.sql`.
4. **Import the data** from the CSV files (or run the insert scripts).
5. **Run the queries** in `queries.sql`.

## Sample Queries

```sql
-- 1. Retrieve all books in a specific genre
SELECT * FROM Books WHERE Genre = 'Fiction';

-- 2. Total revenue generated
SELECT SUM(Total_Amount) AS Total_Revenue FROM Orders;

-- 3. Top 5 best-selling books
SELECT b.Title, SUM(o.Quantity) AS Total_Sold
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Title
ORDER BY Total_Sold DESC
LIMIT 5;

-- 4. Customers with the highest spending
SELECT c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Name
ORDER BY Total_Spent DESC;

-- 5. Books that are low in stock
SELECT Title, Stock FROM Books WHERE Stock < 10;
```

## Key Insights
- Identify best-selling books and genres
- Find top customers by spending
- Track revenue over time
- Monitor stock levels

## Technologies Used
- SQL (MySQL / PostgreSQL)
- Git & GitHub

## Author
**Kirn Thorat**
GitHub: [@kirnthorat](https://github.com/kirnthorat)

---
⭐ If you found this project helpful, please give it a star!
