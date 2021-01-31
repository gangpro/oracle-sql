# Rollup and Cube
> 개발환경<br> 
> OS : Macbook Pro, macOS Mojave, version 10.14.3<br>
> VirtualBox : Version 6.0.4<br>
> Enterprise Linux, Oracle 11g

SQL for Aggregation in Data Warehouses

## 소개 
* https://docs.oracle.com/cd/E11882_01/server.112/e25554/aggreg.htm#DWHSG020
  - ROLLUP Extension to GROUP BY
  - CUBE Extension to GROUP BY
  - GROUPING Functions
  - GROUPING SETS Expression
  - Composite Columns
  - Concatenated Groupings

## Test 데이터 준비
    
      drop table t1 purge;
    
      create table t1
      as
      select deptno a, job b, 'M' as c, ceil(sal*dbms_random.value(1, 2)) d
      from emp;
    
      insert into t1
      select deptno a, job b, 'W' as c, ceil(sal*dbms_random.value(1, 2)) d
      from emp;
    
      select * from t1;

## ROLLUP Extension to GROUP BY
    
      - 컬럼의 갯수가 n개면 결과 집합의 종류는 n+1가지임
      - 컬럼의 나열 순서가 중요함
    
      select a, b, sum(d)
      from t1
      group by ROLLUP(a, b);                    
    
      select a, b, sum(d)
      from t1
      group by GROUPING SETS((a, b), (a), ());
    
        ----
    
      select a, b, c, sum(d)
      from t1
      group by ROLLUP(a, b, c);  
    
      select a, b, c, sum(d)
      from t1
      group by GROUPING SETS((a, b, c), (a, b), (a), ());

## CUBE Extension to GROUP BY
    
      - 컬럼의 갯수가 n개면 결과 집합의 종류는 2^n가지임
      - 컬럼의 나열 순서가 중요하지 않음
    
      select a, b, sum(d)
      from t1
      group by CUBE(a, b);                    
    
      select a, b, sum(d)
      from t1
      group by GROUPING SETS((a, b), (a), (b), ());
    
        ----
    
      select a, b, c, sum(d)
      from t1
      group by CUBE(a, b, c)
      order by a, b, c;
    
      select a, b, c, sum(d)
      from t1
      group by GROUPING SETS((a, b, c), (a, b), (b, c), (a, c),
                             (a), (b), (c), ())
      order by a, b, c;

## GROUPING SETS Expression
    
      - Rollup, Cube에 비해 좀 더 세부적인 집합 요청이 가능함
    
      select a, b, c, sum(d)
      from t1
      group by GROUPING SETS((a, b, c), (a, c), (b), ())
      order by a, b, c;
  

## Concatenated Groupings
* https://docs.oracle.com/cd/E11882_01/server.112/e25554/aggreg.htm#i1007021
###
      Concatenated groupings offer a concise way to generate useful combinations of groupings. 
    
      group by a, rollup(b), cube(c)
      
               a      b         c       a, b, c
                     ()         ()      a, b
                                        a, c
                                        a
               1   *  2   *     2
    
      group by grouping sets((a, b, c), (a, b), (a, c), (a))
    
         ----
    
      GROUP BY ROLLUP(calendar_year, calendar_quarter_desc, calendar_month_desc),
               ROLLUP(country_region, country_subregion, countries.country_iso_code, cust_state_province, cust_city),
               ROLLUP(prod_category_desc, prod_subcategory_desc, prod_name);
    
      GROUP BY GROUPING SETS((calendar_year, calendar_quarter_desc, calendar_month_desc, country_region, country_subregion, countries.country_iso_code, cust_state_province, cust_city, prod_category_desc, prod_subcategory_desc, prod_name),
                             (calendar_year, calendar_quarter_desc, calendar_month_desc, country_region, country_subregion, countries.country_iso_code, cust_state_province, cust_city, prod_category_desc, prod_subcategory_desc),
                             (), ...)
