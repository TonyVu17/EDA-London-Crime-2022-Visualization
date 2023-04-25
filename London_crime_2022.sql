###Problem 1: what is the total number of crime in London in 2022?
SELECT 
    SUM(count) AS 'total reported crime'
FROM
    london_crime;
    
    

###Problem 2: What is the top 3 areas in crime?

SELECT 
    ocu_name, SUM(Count)
FROM
    london_crime
GROUP BY OCU_Name
ORDER BY SUM(count) DESC
LIMIT 3;

###Problem 3: What is top 3 crime sections in London?

SELECT 
    Crime_Section, SUM(Count)
FROM
    london_crime
GROUP BY Crime_Section
ORDER BY SUM(count) DESC
LIMIT 3;

### Problem 4: What is the total crime each month?

select date, sum(count) from london_crime
group by date; 

### Problem 5: What is top 5 crime section in area?

select B.crime_in_area, B.num_crime, rank() over(order by B.num_crime desc) as ra from
(select A.crime_in_area, sum(A.count) as num_crime from(
SELECT 
    CONCAT(ocu_name, ' with ', Crime_Section) AS crime_in_area,
    count
FROM
    london_crime) as A
group by A.crime_in_area) as B
limit 5;






