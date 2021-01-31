## 연습 10-1 : DDL문을 사용하여 테이블 생성 및 관리
select * from tab;
drop table EMP purge;       --Table EMP dropped.

3) 
CREATE TABLE emp
(       id NUMBER(7),
 last_name VARCHAR2(25),
first_name VARCHAR2(25),
   dept_id NUMBER(7)
   CONSTRAINT emp_dept_id_fk REFERENCES dept (id));     --Table EMP created.

select * from emp;

select * from employees;

4)
create table employees2
as
select employee_id ID, first_name FIRST_NAME, last_name LAST_NAME, salary SALARY, department_id DEPT_ID
from employees;     --Table EMPLOYEES2 created.


5)
alter table employees2 read only        --Table EMPLOYEES2 altered.

6)
insert into employees2 values (34, 'Grant', 'Marcie', 5678, 10);
/*
Error starting at line : 28 in command -
insert into employees2 values (34, 'Grant', 'Marcie', 5678, 10)
Error at Command Line : 28 Column : 13
Error report -
SQL Error: ORA-12081: update operation not allowed on table "ACE29"."EMPLOYEES2"
12081. 00000 -  "update operation not allowed on table \"%s\".\"%s\""
*Cause:    An attempt was made to update a read-only materialized view.
*Action:   No action required. Only Oracle is allowed to update a
           read-only materialized view.
*/

7)
alter table employees2 read write   --Table EMPLOYEES2 altered.
insert into employees2 values (34, 'Grant', 'Marcie', 5678, 10);    --1 row inserted.

8)
drop table employees2 purge;
