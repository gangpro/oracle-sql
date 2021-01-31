## 연습 9-1 : 데이터 조작
* lab_09_06.sql file

6) 7)
INSERT INTO my_employee VALUES (&p_id, '&p_last_name', '&p_first_name', '&p_userid', &p_salary);

8)
SELECT * FROM my_employee;

9)
COMMIT;

16)
INSERT INTO my_employee VALUES (&p_id, '&p_last_name', '&p_first_name', '&p_userid', &p_salary);

17)
SELECT * FROM my_employee;

18)
SAVEPOINT step_17;

19)
DELETE FROM my_employee;

20)
SELECT * FROM my_employee;

21)
ROLLBACK TO step_17;

22)
SELECT * FROM my_employee;

23)
COMMIT;