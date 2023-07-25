--데이터 조회하기
--셀렉트 열 from 테이블  
select department_id 부서번호, department_name 부서이름
from departments;

--산술연산(+-*/) 숫자로된열 한정
select last_name 이름 , job_id 직종 , salary 월급 , salary+100 보너스월급,salary-salary*0.1 감봉
from employees;

--DISTINCT 중복 값 제거(똑같은 값이 있을경우 하나만 표시됨)
select DISTINCT job_id 직종
from employees;

--연습문제1)
select employee_id , first_name,last_name
from employees;

--연습문제2)
select first_name ,salary, salary*1.1 AS뉴셀러리
from employees;

--연습문제3)
select employee_id 사원번호 ,first_name 이름 ,last_name 성
from employees;

-- 연결 연산자 || 문자열을 연결 
select last_name || ' is a ' || job_id as "직업 정보"
from employees;

--연습문제
select employee_id 번호, first_name|| ' ' ||last_name name ,email||'@company.com' email
from employees;

-- WHERE 조건절 
select * 
from employees
where last_name = 'King'; --같을경우 =, 데이터는 대소문자를 구별한다. 문자열은 한개 따옴표 

-- WHERE 조건절 
select * 
from employees
where hire_date < '2002-06-10'; --날짜도 비교가 된다. 

--조건절 예제1)
select * 
from employees
where employee_id=100;

--조건절 예제2)
select * 
from employees
where first_name = 'David';

--조건절 예제3)
select * 
from employees
where employee_id <= 105 ;

--조건절 예제4)
select * 
from job_history
where start_date > '2006-03-03' ;

--조건절 예제5)
select * 
from departments
where location_id <> 1700;

--and or not 연산자 ( 논리연산자 )
--and -조건모두 or 하나만만족 not 조건을 만족하지 않아야 검색

select last_name ,department_id,salary
from employees
where department_id=60
or department_id=80 
and salary>10000;
--부서번호60번 또는 10000이상인 SALARY중에 부서번호가 80번인 
-- 순서 and가 먼저라서 
--두개이상의 논리연산을 할 때는 반드시 괄호로
--연산의 우선순위를 결정하는것이 좋음

select *
from employees
where hire_date>'08/04/04'
or salary >13000
and job_id='AD_VP';


--not 
select *
from employees
where not (hire_date >'2004/01/01' or salary > 5000);
--반대 : where(hire_date <='2004/01/01' and salary <= 5000);

--예제 1)
select *
from employees
where salary > 4000 and job_id='IT_PROG';

--예제 2)
select * 
from employees
where salary > 4000 
and (job_id= 'IT_PROG' or job_id='FI_ACCOUNT');

select *
from employees
WHERE salary>4000 AND 
job_id='IT_PROG' or job_id='FI_ACCOUNT';

--in연산자 
select * from employees
where salary =4000 or salary=3000 or salary=2700;

SELECT * from employees
where salary in(4000,3000,2700);
--예제1 
select * from employees 
where salary in(10000,17000,24000);
--예제 2
select * from employees 
where department_id not in(30,50,80,100,110);

--between (and 대신)?
--BETWEEN은 이상(>=) 조건과 이하(<=) 조건을 한 번에 처리하는 범위

--예제1)
select * from employees 
where salary between 10000 and 20000;


--예제2)
select * from employees 
where hire_date between '2004/1/1' and '2004/12/30';
--예제3)

select * from employees 
where salary < 7000 or salary > 17000;
-- 답 
select * from employees 
where salary not between 7000 and 17000;




--like 연산자 문자열 키워드 조회시 %(퍼센트)나 _(언더바)와 같은 기호연산자와 같이 사용 
select * 
from employees 
where last_name like 'B%'; --b로시작하는 모든 문자열 검색

select * 
from employees 
where last_name like '%b%'; --중간에 B가 들어가는 모든 문자열

select * 
from employees 
where last_name like '____y'; -- 언더바 _한개에 한문자를의미, y 로끝나는 모든 문자열 검색 




--예제1)
select * 
from employees 
where job_id like '%AD%';

--예제2)
select * 
from employees 
where job_id 
like '%AD___';

--예제3)

select * 
from employees 
where phone_number like '%1234';

--예제4)
select * 
from employees 
where phone_number not like '%3%' and phone_number like '%9';

--예제5)

select * 
from employees 
where job_id like '%MGR%' or job_id like '%ASST%';

--is null / order by 
--null 값을 검색할ㄸㅐ
select *
from employees
where commission_pct is null;

--null이 아닌경우
select *
from employees
where commission_pct is not null;

select *
from employees
where manager_id is null;

--order by (식의 마지막 . 행에대해 정렬순서를 지정가능 / order by 열 이름 [asc or desc])


select *
from employees
order by salary;--기본정렬 오름차순(ASC)


select *
from employees
order by salary DESC;--기본정렬 내림차순(DESC)

--두개이상 열로 정렬시
--부서번호로 정렬 한 후 사원번호로 정렬 
select department_id, employee_id, first_name, last_name
from employees
order by department_id , employee_id ASC;


select department_id, last_name,salary*12 연봉
from employees
order by 연봉 ;


select department_id, last_name,salary*12 연봉
from employees
order by 3 DESC ;

--예제1)
select employee_id,first_name,last_name
from employees
order by employee_id desc;

--예제2)
select *
from employees
where job_id like '%CLERK%'
order by salary desc;

--예제3)
select employee_id 직원번호,last_name 이름,department_id 부서번호,salary 월급
from employees
where employee_id between 120 and 150
order by department_id desc,salary desc;



