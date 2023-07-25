--������ ��ȸ�ϱ�
--����Ʈ �� from ���̺�  
select department_id �μ���ȣ, department_name �μ��̸�
from departments;

--�������(+-*/) ���ڷεȿ� ����
select last_name �̸� , job_id ���� , salary ���� , salary+100 ���ʽ�����,salary-salary*0.1 ����
from employees;

--DISTINCT �ߺ� �� ����(�Ȱ��� ���� ������� �ϳ��� ǥ�õ�)
select DISTINCT job_id ����
from employees;

--��������1)
select employee_id , first_name,last_name
from employees;

--��������2)
select first_name ,salary, salary*1.1 AS��������
from employees;

--��������3)
select employee_id �����ȣ ,first_name �̸� ,last_name ��
from employees;

-- ���� ������ || ���ڿ��� ���� 
select last_name || ' is a ' || job_id as "���� ����"
from employees;

--��������
select employee_id ��ȣ, first_name|| ' ' ||last_name name ,email||'@company.com' email
from employees;

-- WHERE ������ 
select * 
from employees
where last_name = 'King'; --������� =, �����ʹ� ��ҹ��ڸ� �����Ѵ�. ���ڿ��� �Ѱ� ����ǥ 

-- WHERE ������ 
select * 
from employees
where hire_date < '2002-06-10'; --��¥�� �񱳰� �ȴ�. 

--������ ����1)
select * 
from employees
where employee_id=100;

--������ ����2)
select * 
from employees
where first_name = 'David';

--������ ����3)
select * 
from employees
where employee_id <= 105 ;

--������ ����4)
select * 
from job_history
where start_date > '2006-03-03' ;

--������ ����5)
select * 
from departments
where location_id <> 1700;

--and or not ������ ( �������� )
--and -���Ǹ�� or �ϳ������� not ������ �������� �ʾƾ� �˻�

select last_name ,department_id,salary
from employees
where department_id=60
or department_id=80 
and salary>10000;
--�μ���ȣ60�� �Ǵ� 10000�̻��� SALARY�߿� �μ���ȣ�� 80���� 
-- ���� and�� ������ 
--�ΰ��̻��� �������� �� ���� �ݵ�� ��ȣ��
--������ �켱������ �����ϴ°��� ����

select *
from employees
where hire_date>'08/04/04'
or salary >13000
and job_id='AD_VP';


--not 
select *
from employees
where not (hire_date >'2004/01/01' or salary > 5000);
--�ݴ� : where(hire_date <='2004/01/01' and salary <= 5000);

--���� 1)
select *
from employees
where salary > 4000 and job_id='IT_PROG';

--���� 2)
select * 
from employees
where salary > 4000 
and (job_id= 'IT_PROG' or job_id='FI_ACCOUNT');

select *
from employees
WHERE salary>4000 AND 
job_id='IT_PROG' or job_id='FI_ACCOUNT';

--in������ 
select * from employees
where salary =4000 or salary=3000 or salary=2700;

SELECT * from employees
where salary in(4000,3000,2700);
--����1 
select * from employees 
where salary in(10000,17000,24000);
--���� 2
select * from employees 
where department_id not in(30,50,80,100,110);

--between (and ���)?
--BETWEEN�� �̻�(>=) ���ǰ� ����(<=) ������ �� ���� ó���ϴ� ����

--����1)
select * from employees 
where salary between 10000 and 20000;


--����2)
select * from employees 
where hire_date between '2004/1/1' and '2004/12/30';
--����3)

select * from employees 
where salary < 7000 or salary > 17000;
-- �� 
select * from employees 
where salary not between 7000 and 17000;




--like ������ ���ڿ� Ű���� ��ȸ�� %(�ۼ�Ʈ)�� _(�����)�� ���� ��ȣ�����ڿ� ���� ��� 
select * 
from employees 
where last_name like 'B%'; --b�ν����ϴ� ��� ���ڿ� �˻�

select * 
from employees 
where last_name like '%b%'; --�߰��� B�� ���� ��� ���ڿ�

select * 
from employees 
where last_name like '____y'; -- ����� _�Ѱ��� �ѹ��ڸ��ǹ�, y �γ����� ��� ���ڿ� �˻� 




--����1)
select * 
from employees 
where job_id like '%AD%';

--����2)
select * 
from employees 
where job_id 
like '%AD___';

--����3)

select * 
from employees 
where phone_number like '%1234';

--����4)
select * 
from employees 
where phone_number not like '%3%' and phone_number like '%9';

--����5)

select * 
from employees 
where job_id like '%MGR%' or job_id like '%ASST%';

--is null / order by 
--null ���� �˻��Ҥ���
select *
from employees
where commission_pct is null;

--null�� �ƴѰ��
select *
from employees
where commission_pct is not null;

select *
from employees
where manager_id is null;

--order by (���� ������ . �࿡���� ���ļ����� �������� / order by �� �̸� [asc or desc])


select *
from employees
order by salary;--�⺻���� ��������(ASC)


select *
from employees
order by salary DESC;--�⺻���� ��������(DESC)

--�ΰ��̻� ���� ���Ľ�
--�μ���ȣ�� ���� �� �� �����ȣ�� ���� 
select department_id, employee_id, first_name, last_name
from employees
order by department_id , employee_id ASC;


select department_id, last_name,salary*12 ����
from employees
order by ���� ;


select department_id, last_name,salary*12 ����
from employees
order by 3 DESC ;

--����1)
select employee_id,first_name,last_name
from employees
order by employee_id desc;

--����2)
select *
from employees
where job_id like '%CLERK%'
order by salary desc;

--����3)
select employee_id ������ȣ,last_name �̸�,department_id �μ���ȣ,salary ����
from employees
where employee_id between 120 and 150
order by department_id desc,salary desc;



