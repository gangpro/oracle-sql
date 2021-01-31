## 연습 9-1 : 데이터 조작
* lab_09_01.sql file
1)

DROP TABLE my_employee;

CREATE TABLE my_employee
(id         NUMBER(4) CONSTRAINT my_employee_id_pk PRIMARY KEY,
last_name   VARCHAR2(25),
first_name  VARCHAR2(25),
userid      VARCHAR2(8),
salary      NUMBER(9,2));

2)
DESCRIBE my_employee

3) 
INSERT INTO my_employee VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

4)
INSERT INTO my_employee (id, last_name, first_name, userid, salary) VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

5)
SELECT * FROM my_employee;

6~9) lab_09_06.sql 파일에

10)
UPDATE my_employee SET last_name = 'Drexler' WHERE id = 3;

11)
UPDATE my_employee SET salary = 1000 WHERE salary < 900;

12)
SELECT * FROM my_employee;

13)
DELETE FROM my_employee WHERE last_name = 'Dancs';

14)
SELECT * FROM my_employee;

15)
COMMIT;