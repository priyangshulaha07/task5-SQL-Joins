==============================
TASK 5: SQL JOINS – CONCEPTUAL GUIDE WITH OUTCOMES
==============================

🎯 OBJECTIVE:
To understand and explain how different types of SQL joins work,
their use cases, and the expected results when joining related tables.

==============================
1. TABLE OVERVIEW (SAMPLE DATA)
==============================

CUSTOMERS:
+-------------+---------+----------+
| customer_id | name    | city     |
+-------------+---------+----------+
| 1           | Alice   | Delhi    |
| 2           | Bob     | Mumbai   |
| 3           | Charlie | Kolkata  |
| 4           | Diana   | Chennai  |
+-------------+---------+----------+

ORDERS:
+----------+-------------+------------+---------+
| order_id | customer_id | order_date | amount  |
+----------+-------------+------------+---------+
| 101      | 1           | 2025-06-01 | 1500.00 |
| 102      | 2           | 2025-06-05 | 2200.00 |
| 103      | 1           | 2025-06-10 | 900.00  |
+----------+-------------+------------+---------+

==============================
2. TYPES OF JOINS WITH OUTCOMES
==============================

🔹 INNER JOIN:
- Returns only rows with matching customer_id in both tables.

Expected Output:
+---------+----------+--------+
| name    | order_id | amount |
+---------+----------+--------+
| Alice   | 101      | 1500   |
| Bob     | 102      | 2200   |
| Alice   | 103      | 900    |
+---------+----------+--------+

🔹 LEFT JOIN:
- All rows from Customers; orders added if available.

Expected Output:
+---------+----------+--------+
| name    | order_id | amount |
+---------+----------+--------+
| Alice   | 101      | 1500   |
| Alice   | 103      | 900    |
| Bob     | 102      | 2200   |
| Charlie | NULL     | NULL   |
| Diana   | NULL     | NULL   |
+---------+----------+--------+

🔹 RIGHT JOIN: *(Only in MySQL)*
- All rows from Orders; customer info added if available.

Expected Output:
+---------+----------+--------+
| name    | order_id | amount |
+---------+----------+--------+
| Alice   | 101      | 1500   |
| Bob     | 102      | 2200   |
| Alice   | 103      | 900    |
+---------+----------+--------+

(Note: No unmatched orders, so same as INNER JOIN)

🔹 FULL OUTER JOIN (Simulated using LEFT JOIN + RIGHT JOIN + UNION):
- Returns all customers and all orders, matched or not.

Expected Output:
+-------------+---------+----------+--------+
| customer_id | name    | order_id | amount |
+-------------+---------+----------+--------+
| 1           | Alice   | 101      | 1500   |
| 1           | Alice   | 103      | 900    |
| 2           | Bob     | 102      | 2200   |
| 3           | Charlie | NULL     | NULL   |
| 4           | Diana   | NULL     | NULL   |
+-------------+---------+----------+--------+

