CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	balance INTEGER NOT NULL
);

INSERT INTO accounts(name, balance)
VALUES 
	('GIA', 100),
	('Alyson', 100);

SELECT * FROM accounts;
UPDATE accounts SET balance = 100;

-- TRANSACTION allows run separate statements
-- 1). OPEN A TRANSACTION: CREATE SEPARATE WORKSPACE
BEGIN;
-- 2). STATEMENT
UPDATE accounts
SET balance = balance - 50
WHERE name = 'Alyson';

UPDATE accounts
SET balance = balance + 50
WHERE name = 'GIA';
-- 3). COMMIT: save merge data / ROLLBACK: dont save changes
COMMIT;
-- If we occurs errors / aborted we need to rollback manually
SELECT * FROM ads;
ROLLBACK;
