CREATE DATABASE IF NOT EXISTS employee;
USE employee;

/*
CREATE TABLE data_science_team (
             emp_id VARCHAR (30),
             first_name TEXT,
             Last_name TEXT,
             Gender TEXT,
             role TEXT,
             dept TEXT,
             exp TEXT,
             country TEXT,
             continent TEXT);
             */
             
	SELECT *
    FROM data_science_team;
    
    SELECT EMP_ID, FIRST_NAME,LAST_NAME,GENDER,DEPT
    FROM emp_record_table;
    
    SELECT EMP_ID, FIRST_NAME, LAST_NAME,GENDER,DEPT,EMP_RATING
    FROM emp_record_table
    WHERE EMP_RATING < 2;
    
     SELECT EMP_ID, FIRST_NAME, LAST_NAME,GENDER,DEPT,EMP_RATING
    FROM emp_record_table
    WHERE EMP_RATING > 4;
    
     SELECT EMP_ID, FIRST_NAME, LAST_NAME,GENDER,DEPT,EMP_RATING
    FROM emp_record_table
    WHERE EMP_RATING 
    BETWEEN 2 AND 4;
    
    SELECT CONCAT (FIRST_NAME, ' ',LAST_NAME) AS NAME
    FROM emp_record_table
    WHERE DEPT = 'FINANCE';
    
    (SELECT * 
    FROM emp_record_table
    WHERE DEPT = 'HEALTHCARE')
    UNION
    (SELECT *
    FROM emp_record_table
    WHERE DEPT = 'FINANCE');
    
    
    SELECT e.EMP_ID, e.FIRST_NAME, e.LAST_NAME, e.ROLE, e.DEPT, e.EMP_RATING, d.MaxRating
	FROM employee e
JOIN (
    SELECT DEPT, MAX(EMP_RATING) AS MaxRating
    FROM employee
    GROUP BY DEPT
) d ON e.DEPARTMENT = d.DEPARTMENT;

	SELECT ROLE, MIN(SALARY) AS min_salary, MAX(SALARY) AS max_salary
    FROM emp_record_table
    GROUP BY ROLE;
 
    
   CREATE VIEW HighSalaryEmployees AS
   SELECT EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, SALARY
   FROM emp_record_table
   WHERE SALARY > 6000;
  
   SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP
   FROM emp_record_table
   WHERE EMP_ID IN (
   SELECT EMP_ID
   FROM emp_record_table
   WHERE EXP > 10
);

GetExperiencedEmployees   DELIMITER //
CREATE PROCEDURE GetExperiencedEmployees()
BEGIN
  SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP
  FROM emp_record_table
  WHERE EXP > 3;
END //
DELIMITER ;
	
    
   SELECT
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    EXP,
    CASE ROLE
        WHEN EXP <= 2 THEN 'JUNIOR DATA SCIENTIST'
        WHEN EXP > 2 AND EXP <= 5 THEN 'ASSOCIATE DATA SCIENTIST'
        WHEN EXP > 5 AND EXP <= 10 THEN 'SENIOR DATA SCIENTIST'
        WHEN EXP > 10 AND EXP <= 12 THEN 'LEAD DATA SCIENTIST'
        WHEN EXP > 12 AND EXP <= 16 THEN 'MANAGER'
   END AS standard_job_profile
   FROM 
   data_science_team;
       
     CREATE INDEX idx_first_name
	 ON emp_record_table (FIRST_NAME);

SELECT 
    EMP_ID, 
    SALARY, 
    EMP_RATING, 
    ROUND (SALARY * EMP_RATING * 0.05) AS bonus
FROM 
    emp_record_table;
    
    
SELECT
    CONTINENT,
    COUNTRY,
    AVG (emp_record_table.SALARY) as average_salary
FROM
    emp_record_table;


    