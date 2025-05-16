# **MySQL Ultimate Cheatsheet**  

*All essential MySQL commands in one place for quick reference.*  

---

## **1. Database Operations**  

### **Show Databases**  

```sql
SHOW DATABASES;
```

### **Create Database**  

```sql
CREATE DATABASE db_name;
```

### **Delete Database**  

```sql
DROP DATABASE db_name;
```

### **Select Database (Switch)**  

```sql
USE db_name;
```

---

## **2. Table Operations**  

### **Show Tables in Current Database**  

```sql
SHOW TABLES;
```

### **Create Table**  

```sql
CREATE TABLE table_name (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### **Describe Table Structure**  

```sql
DESCRIBE table_name;
-- OR
SHOW COLUMNS FROM table_name;
```

### **Delete Table**  

```sql
DROP TABLE table_name;
```

### **Rename Table**  

```sql
RENAME TABLE old_name TO new_name;
```

### **Truncate Table (Delete All Rows)**  

```sql
TRUNCATE TABLE table_name;
```

### **Alter Table (Add/Modify/Delete Column)**  

```sql
ALTER TABLE table_name ADD COLUMN new_column VARCHAR(100);
ALTER TABLE table_name MODIFY COLUMN column_name INT;
ALTER TABLE table_name DROP COLUMN column_name;
```

---

## **3. Querying Data**  

### **Basic SELECT**  

```sql
SELECT * FROM table_name;
SELECT column1, column2 FROM table_name;
```

### **Filtering (WHERE Clause)**  

```sql
SELECT * FROM table_name WHERE condition;
-- Examples:
SELECT * FROM users WHERE age > 18;
SELECT * FROM products WHERE price BETWEEN 10 AND 100;
SELECT * FROM employees WHERE name LIKE 'J%'; -- Starts with 'J'
SELECT * FROM orders WHERE status IN ('Pending', 'Shipped');
```

### **Sorting (ORDER BY)**  

```sql
SELECT * FROM table_name ORDER BY column1 ASC|DESC;
SELECT * FROM users ORDER BY name ASC, age DESC;
```

### **Limiting Results (LIMIT & OFFSET)**  

```sql
SELECT * FROM table_name LIMIT 10; -- First 10 rows
SELECT * FROM table_name LIMIT 5 OFFSET 10; -- Skip 10, show next 5
-- Equivalent to:
SELECT * FROM table_name LIMIT 10, 5;
```

### **DISTINCT (Unique Values)**  

```sql
SELECT DISTINCT column_name FROM table_name;
```

---

## **4. Aggregations & Grouping**  

### **Common Aggregation Functions**  

```sql
SELECT COUNT(*) FROM table_name;
SELECT SUM(column1) FROM table_name;
SELECT AVG(column1) FROM table_name;
SELECT MIN(column1) FROM table_name;
SELECT MAX(column1) FROM table_name;
```

### **GROUP BY (Group Rows)**  

```sql
SELECT department, COUNT(*) FROM employees GROUP BY department;
```

### **HAVING (Filter Groups)**  

```sql
SELECT department, AVG(salary) 
FROM employees 
GROUP BY department 
HAVING AVG(salary) > 50000;
```

---

## **5. Joins (Combine Tables)**  

### **INNER JOIN (Matching Rows Only)**  

```sql
SELECT t1.column1, t2.column2 
FROM table1 t1
INNER JOIN table2 t2 ON t1.id = t2.table1_id;
```

### **LEFT JOIN (All Rows from Left + Matches from Right)**  

```sql
SELECT t1.column1, t2.column2 
FROM table1 t1
LEFT JOIN table2 t2 ON t1.id = t2.table1_id;
```

### **RIGHT JOIN (All Rows from Right + Matches from Left)**  

```sql
SELECT t1.column1, t2.column2 
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.id = t2.table1_id;
```

### **FULL OUTER JOIN (Not natively in MySQL, use UNION of LEFT + RIGHT JOIN)**  

```sql
SELECT t1.column1, t2.column2 FROM table1 t1 LEFT JOIN table2 t2 ON t1.id = t2.table1_id
UNION
SELECT t1.column1, t2.column2 FROM table1 t1 RIGHT JOIN table2 t2 ON t1.id = t2.table1_id;
```

---

## **6. Modifying Data**  

### **INSERT (Add New Rows)**  

```sql
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
-- Insert multiple rows:
INSERT INTO table_name (column1, column2) 
VALUES (value1, value2), (value3, value4);
```

### **UPDATE (Modify Existing Rows)**  

```sql
UPDATE table_name SET column1 = new_value WHERE condition;
-- Example:
UPDATE users SET email = 'new@email.com' WHERE id = 1;
```

### **DELETE (Remove Rows)**  

```sql
DELETE FROM table_name WHERE condition;
-- Example:
DELETE FROM users WHERE id = 5;
```

---

## **7. Indexes (Improve Performance)**  

### **Create Index**  

```sql
CREATE INDEX idx_name ON table_name (column1);
```

### **Drop Index**  

```sql
DROP INDEX idx_name ON table_name;
```

---

## **8. Transactions (ACID Compliance)**  

### **Start & Commit/Rollback**  

```sql
START TRANSACTION;
-- SQL statements (INSERT, UPDATE, DELETE)
COMMIT; -- Save changes
-- OR
ROLLBACK; -- Undo changes
```

---

## **9. User & Permissions**  

### **Show Users**  

```sql
SELECT user FROM mysql.user;
```

### **Create User**  

```sql
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
```

### **Grant Permissions**  

```sql
GRANT SELECT, INSERT ON db_name.* TO 'username'@'localhost';
GRANT ALL PRIVILEGES ON db_name.* TO 'username'@'localhost';
```

### **Revoke Permissions**  

```sql
REVOKE INSERT ON db_name.* FROM 'username'@'localhost';
```

### **Flush Privileges (Reload Permissions)**  

```sql
FLUSH PRIVILEGES;
```

---

## **10. Backup & Restore**  

### **Export (Backup) Database**  

```bash
mysqldump -u username -p db_name > backup.sql
```

### **Import (Restore) Database**  

```bash
mysql -u username -p db_name < backup.sql
```

---

## **Bonus: Common Filters & Operators**  

| Operator | Description | Example |
|----------|-------------|---------|
| `=` | Equal | `WHERE age = 25` |
| `!=` or `<>` | Not equal | `WHERE status != 'Done'` |
| `>` `<` `>=` `<=` | Comparisons | `WHERE salary > 50000` |
| `BETWEEN` | Range | `WHERE age BETWEEN 18 AND 30` |
| `LIKE` | Pattern match | `WHERE name LIKE 'A%'` |
| `IN` | Match in list | `WHERE id IN (1, 2, 3)` |
| `IS NULL` / `IS NOT NULL` | Check for NULL | `WHERE email IS NULL` |

---

### **Final Notes**  

- Use `WHERE` for filtering rows, `HAVING` for filtering groups.  
- `JOIN` connects tables, `UNION` combines query results.  
- Always back up before `DROP` or major changes!  
