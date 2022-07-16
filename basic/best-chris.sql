CREATE SCHEMA best_chris;
SET search_path = best_chris;

CREATE TABLE sales (
  "sales_id" INTEGER,
  "name" VARCHAR(30)
);

INSERT INTO sales
  ("sales_id", "name")
VALUES
  ('1', 'Chris Hamsvalue'),
  ('2', 'Chris Evians'),
  ('3', 'Benedict Lumberjack'),
  ('4', 'Chris P. Ratatouille'),
  ('5', 'Chris Pint');

CREATE TABLE transactions (
  "transaction_id" INTEGER,
  "sales_id" INTEGER,
  "amount_usd" INTEGER
);

INSERT INTO transactions
  ("transaction_id", "sales_id", "amount_usd")
VALUES
  ('1', '1', '10000'),
  ('2', '2', '20000'),
  ('3', '4', '20000'),
  ('4', '1', '40000'),
  ('5', '5', '80000'),
  ('6', '3', '20000'),
  ('7', '2', '40000'),
  ('8', '4', '30000');
  
  
SELECT name as sales_name,
       sum(amount_usd) as ttl_sales
FROM best_chris.sales s
JOIN best_chris.transactions t
ON s.sales_id = t.sales_id
WHERE name like 'Chris %'
GROUP BY name
HAVING count(transaction_id) > 1
ORDER BY ttl_sales desc
LIMIT 1
