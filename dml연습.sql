--  1. passenger, ticket, survived 테이블을 조인하고 Survived가 1인사람들
-- 만찾아서 Name, Age, Sex, Pclass, survived 컬럼을출력하시오.
select Name, Age, Sex, Pclass, survived 
from passenger as p
join
ticket as t
on p.PassengerId = t.PassengerId
join survived as s
on p.PassengerId = s.PassengerId
where Survived = 1
;

-- 2  1의결과를 10개만출력하시오
select Name, Age, Sex, Pclass, survived 
from passenger as p
join
ticket as t
on p.PassengerId = t.PassengerId
join survived as s
on p.PassengerId = s.PassengerId
where Survived = 1
limit  10
;
-- 3 Passenger 테이블을기준 ticket, survived테이블을 LEFT JOIN 한결과
-- 에서성별이여성이면서 Pclass가 1인사람중생존자(survived=1)를 찾아
-- 이름, 성별, Pclass를표시하시오.

select name,sex,pclass
from passenger as p
left join
ticket as t
on p.PassengerId = t.PassengerId
left join 
survived as s
on p.PassengerId = s.PassengerId
where sex = 'female'and Pclass = 1 and Survived = 1 
;

-- 4
select *
from passenger as p
left join
ticket as t
on p.PassengerId = t.PassengerId
left join 
survived as s
on p.PassengerId = s.PassengerId
where age between 10 and 20 and pclass = 2 and Survived = 1
;

-- 5
select *
from passenger as p
left join
ticket as t
on p.PassengerId = t.PassengerId
left join 
survived as s
on p.PassengerId = s.PassengerId
where sex = 'female' or Pclass = 1 and Survived = 1
;

-- 6 
select name,pclass,age,parch,age,parch,Survived
from passenger as p
left join
ticket as t
on p.PassengerId = t.PassengerId
left join 
survived as s
on p.PassengerId = s.PassengerId
where Survived = 1 and name like '%Mrs%' 
;

-- 7
select name,sex,age
from passenger as p
left join
ticket as t
on p.PassengerId = t.PassengerId
left join 
survived as s
on p.PassengerId = s.PassengerId
where Pclass in(1,2) and  Embarked in('s','c') and Survived = 1
;

-- 8
select name,sex,age
from passenger as p
left join
ticket as t
on p.PassengerId = t.PassengerId
left join 
survived as s
on p.PassengerId = s.PassengerId
where name like '%James%' and Survived = 1
order by age desc
;

-- 9
select sex,count(sex)as total
from passenger as p
inner join
ticket as t
on p.PassengerId = t.PassengerId
inner join 
survived as s
on p.PassengerId = s.PassengerId
where Survived = 1
group by sex
;

-- 10
select sex,count(sex)as total,avg(age)
from passenger as p
inner join
ticket as t
on p.PassengerId = t.PassengerId
inner join 
survived as s
on p.PassengerId = s.PassengerId
where Survived = 1
group by sex
;

-- 11
select pclass,sex,Survived,count(survived)as total,Avg(age)
from passenger as p
inner join
ticket as t
on p.PassengerId = t.PassengerId
inner join 
survived as s
on p.PassengerId = s.PassengerId
group by Pclass,sex,Survived
order by Pclass
;