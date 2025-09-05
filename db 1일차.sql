use titanic;
show databases;
desc p_info;

--  데이터를 조회하는 기본 쿼리
-- select  조회를 원하는 컬럼명 *(모두) from 테이블명;
select * from p_info limit 10;
select name, Age, passengerid from p_info;

-- 조건에 맞는 데이터 검색라기 where 
-- select * from 테이블 명 where 조건;
select * from p_info where age >= 30;
-- p_info테이블에서 20살 이상 50세 미만의 여성을 조회하시오.
select * from p_info where age >= 20 and  age < 50;

-- p_info 테이블에서 sibsp 와 parch 가 1이상인 사람을 조회하시오.
select * from p_info where sibsp >= 1 and parch >=1;

-- p_info 테이블에서 pclass가 1인 승객을 조회하시오.
select * from t_info;
select * from t_info where pclass = 1;

-- t_info 테이블에서 pcalss가 2인 또는 fare 50 초과인 승객을 조회하시오.alter
select* from t_info where pclass = 2 or fare >50;

-- survived 테이블에서 survived가 1인 승객을 조회하시오.
select * from survived;
select * from survived where survived = 1;

-- p_info 테이블에서 sibsp 컬럽의 값이 1,2,3, 인 경우의 행 찾기
select * from p_info where sibsp in(1,2,3);
-- like 문자열을 검색 할 떄 사용
select * from p_info;
select * from p_info where name = 'Heikkinen,miss Laina';
select * from p_info where name like '%laina';
select * from p_info where name like 'laina%';
select * from p_info where name like '%miss%';

-- between a and b A이상 B이하인 경우
-- p_info 테이블에서 age 컬럼 값이 20이상 40이하인 값 찾기
select * from p_info where age >= 20 and age <=40;
select * from p_info where age between 20 and 40;

-- 조회한 데이터 정렬하기 order by
-- p_info 테이블에서 age가 null이 아니면서 이름에 miss가 포함된
-- 40세 이하의 여성을 조회하고 나를 기준으로 내림차순 정렬하세요.

select * from p_info where age is not null and name like '%miss%' 
and age <= 40 and sex = 'female' order by age desc;

-- 그룹 연산 group by 특정 컬럼을 기준으로 다른 컬럼 데이터를 집계 할 떄 주로 사용
-- select 기준 컬럼명,그룹 연산 함수 from 테이블명 where 컬럼명
-- group by 기준 컬럼;
-- 그룹 연삼 함수 avg() , min 최솟값 ,max 최대값, 
-- count() - 행개수

-- p_info 테이블에서 나이가 null이 아닌 행의 성별별 나이 평균을 구하세요.
select sex, avg(age) from p_info where age is not null
group by sex;

-- 그룹 연산을 한 후 특정값에 해당하는 데이터를 보고 싶을 떄 having절 사용
-- t_info 테이블에서 pclass별 fare 가격 쳥균을 구하고 그중 가격 평균이 50을 초과하는 결과만 조회하세요.

select pclass, avg(fare) from t_info group by pclass having avg(fare) > 50;

-- 여러 곳에 분산된 데이터를 모아서 조회하기 join 
select * from passenger;
select * from ticket;

-- inner join 왼쪽 테이블과 오른쪽 테이블에서 기준 컬럼에 있는 데이터가 일치할 떄
-- passengerid = 기준컬럼
-- select*from 왼쪽테이블명 조인방법(inner,left,right) join 오른쪽 테이블명
-- on 왼쪽테이블명.기준컬럼명 = 오른쪽테이블명.기준컬럼명;
select * from passenger join ticket
on passenger.passengerid = ticket.passengerid;

select passenger.passengerid,name,sex,age,pclass,fare
from passenger join ticket
on passenger.passengerid = ticket.passengerid;

-- 테이블명의 약칭(별명) as 별명, 별명
select p.passengerid,name,sex,age,pclass,fare
from passenger as p join ticket as t
on p.passengerid = t.passengerid;

-- left join 
select * from passenger p left join ticket t
on p.passengerid = t.passengerid;

-- right join
select * from passenger p right join ticket t
on p.passengerid = t.passengerid;

-- 3개 이상의 테이블을 조인하고 싶을떄 survived
select * from passenger p 
inner join ticket t
on p.passengerid = t.passengerid 
inner join survived s on p.passengerid = s.passengerid;