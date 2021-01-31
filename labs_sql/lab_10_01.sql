## 연습 10-1 : DDL문을 사용하여 테이블 생성 및 관리

select * from tab;
select * from DEPT;
drop table DEPT purge;

1)
CREATE TABLE DEPT
 (ID NUMBER(7),
NAME VARCHAR2(25),
PRIMARY KEY(ID));

describe dept;

2)
select * from DEPARTMENTS;

--실패한거
INSERT INTO DEPT(ID, NAME) VALUES(SELECT DEPARMENT_ID FROM DEPARMENTS, SELECT DEPARMENT_NAME FROM DEPARMENTS);

--성공한거
insert into dept
select department_id, department_name
from departments;

select * from dept;

