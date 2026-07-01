CREATE TABLE hrdata (
    emp_no INT PRIMARY KEY,
    gender VARCHAR(20) NOT NULL,
    marital_status VARCHAR(30),
    age_band VARCHAR(20),
    age INT,
    department VARCHAR(100),
    education VARCHAR(100),
    education_field VARCHAR(100),
    job_role VARCHAR(100),
    business_travel VARCHAR(50),
    employee_count INT,
    attrition VARCHAR(10),
    attrition_label VARCHAR(50),
    job_satisfaction INT,
    active_employee INT
);

SELECT * FROM hrdata

-- 1 Total employees with 'high school' education
SELECT 
	SUM(employee_count) AS total_employees
FROM hrdata
WHERE education = 'High School';

-- 2 
SELECT 
	SUM(employee_count) AS total_employees
FROM hrdata
WHERE department = 'R&D';

-- 3
SELECT 
	SUM(employee_count) AS total_employees
FROM hrdata
WHERE education_field = 'Medical';

-- 4
SELECT 
	COUNT(attrition) AS total_count
FROM hrdata
WHERE attrition = 'Yes';

-- 5
SELECT 
	COUNT(attrition) AS total_count
FROM hrdata
WHERE attrition = 'Yes'
	AND 
	education = 'Doctoral Degree';

-- 6
SELECT 
	COUNT(attrition) AS total_count
FROM hrdata
WHERE attrition = 'Yes'
	AND 
	department = 'R&D';

-- 7
SELECT 
	COUNT(attrition) AS total_count
FROM hrdata
WHERE attrition = 'Yes'
	AND 
	department = 'R&D'
	AND
	education_field = 'Medical'
	AND
	education = 'High School';

-- 8 percentage of attrition data
SELECT 
	ROUND(((SELECT COUNT(attrition)
	FROM hrdata
	WHERE attrition = 'Yes'):: NUMERIC / SUM(employee_count)) * 100,2)
FROM hrdata;

-- 
SELECT 
	ROUND(((SELECT COUNT(attrition)
	FROM hrdata
	WHERE attrition = 'Yes' AND department = 'Sales'):: NUMERIC / SUM(employee_count)) * 100,2)
FROM hrdata
WHERE department = 'Sales';

-- 
SELECT 
	SUM(employee_count) - (SELECT COUNT(attrition)
							FROM hrdata
							WHERE attrition = 'Yes' AND gender = 'Male')
FROM hrdata
WHERE gender = 'Male';

-- 
SELECT 
	ROUND(AVG(age),0) AS avg_age
FROM hrdata;

-- attrition by gender
SELECT 
	gender,
	COUNT(attrition)
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

-- 
SELECT 
	gender,
	COUNT(attrition)
FROM hrdata
WHERE attrition = 'Yes' AND education = 'High School'
GROUP BY 1
ORDER BY 2 DESC;

-- department wise attrition
SELECT
	department,
	COUNT(attrition)
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

-- 
SELECT
	department,
	COUNT(attrition),
	ROUND((COUNT(attrition)::NUMERIC / (SELECT COUNT(attrition)
						FROM hrdata
						WHERE attrition = 'Yes' AND gender = 'Female')) * 100,2)
FROM hrdata
WHERE attrition = 'Yes' AND gender = 'Female'
GROUP BY 1
ORDER BY 2 DESC;

-- 
SELECT
	age,
	SUM(employee_count)
FROM hrdata
WHERE department = 'R&D'
GROUP BY 1
ORDER BY 1;

-- 
SELECT 
	education_field,
	COUNT(attrition)
FROM hrdata
WHERE attrition = 'Yes' AND department = 'Sales'
GROUP BY 1
ORDER BY 2 DESC;

-- attrtition by age
SELECT 
	age_band,
	gender,
	COUNT(attrition)
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY 1,2
ORDER BY 1,2 DESC;

-- 
SELECT 
	age_band,
	gender,
	COUNT(attrition),
	ROUND(COUNT(attrition)::NUMERIC / (SELECT COUNT(attrition)
								FROM hrdata
								WHERE attrition = 'Yes') * 100,2)
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY 1,2
ORDER BY 1,2 DESC;

-- 
SELECT 
	age_band,
	gender,
	SUM(employee_count)
FROM hrdata
GROUP BY 1,2
ORDER BY 1,2 DESC;

















