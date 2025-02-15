select count(*) from titanic;

-- 1. Show the first 10 rows of the dataset.
select * from titanic
limit 10;
--  Show the last 10 rows of the dataset.
select * from titanic
order by PassengerId desc limit 10;

-- 2. Find the number of passengers who survived.
select * from titanic
where Survived = 1;
select count(*) from titanic
where Survived = 1;

-- 3. Find the average age of all passengers.
select avg(Age) as Average_age from  titanic;


-- 4. Find the number of passengers in each class.
select Pclass,count(*) as Total_class  from titanic 
group by Pclass;

-- 5. Find the first 10 rows of the dataset sorted by passenger class in descending order.
select * from titanic
 order by Pclass desc
 limit 10;
 
-- 6. Find the number of passengers in each class sorted by class in ascending order.
select count(PClass) from titanic
group by Pclass
order by Pclass asc;


-- 7. Find the average fare paid by passengers in each class.
select PClass,avg(Fare) as Average_per_Class from titanic
group by Pclass;

-- 8. Find the name of the passenger with the highest fare.
-- select  max(Fare) from titanic;
select name,Fare from titanic where fare = (select max(Fare) from titanic);
-- select name,Fare from titanic
-- where Fare = (select max(Fare) from titanic)

-- 9. Find the name of the passenger who had the highest age among the survivors.
select max(Age) from titanic;
-- another way
select name, Age from titanic
where Age = (select max(Age) from titanic);

select name,age from titanic 
where age= (select max(age) from titanic where Survived = 1)
and Survived =1;



-- 10. Find the number of passengers who paid more than the average fare.
select count(*) from titanic
where Fare > (select avg(Fare) from titanic);

-- select count(*) as num_passengers from titanic 
-- where Fare > (select avg(Fare) from titanic);

-- 11. Find the name of the passenger who had the most parents or children on board.
select name,Parch from titanic
where Parch = (select max(Parch)from titanic);


-- 12. Find the number of male and female passengers who survived, 
select Sex,count(Sex) from titanic
group by Sex;

-- 13. Find the name, age, and fare of the oldest passenger who survived.
select name,age,fare from titanic
where age= (select max(age) from titanic where Survived = 1)
and Survived = 1;


-- 14. Find the name and age of the youngest female passenger who survived in third class.
select min(age) from titanic
where sex= 'female' and Pclass = 3 and Survived = 1;

select name,age from titanic
where sex= "female" and Pclass = 3 and Survived = 1
and age = (select min(age) where sex="female" and Pclass = 3 and Survived = 1) 
order by age asc;

-- 15. Find Number of male and female passengers.
select sex,count(sex) from titanic
group by sex
order by sex asc;

-- select 
-- sum(case when Sex = "male" then 1 else 0 end) as num_male,
-- sum(case when Sex = "female" then 1 else 0 end) as num_female 

-- from titanic;


-- 16. Select all passengers who traveled in a cabin that was not shared by other passengers.
select * from titanic 
where cabin not in 
(select Cabin from titanic group by cabin having count(*) > 1);




