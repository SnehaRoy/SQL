SELECT MAX(SecondHighestSalary) AS SecondHighestSalary
FROM
(
    SELECT
        CASE 
            WHEN max_rn = 1 THEN null
            WHEN RN = 2 THEN salary
        END AS SecondHighestSalary
    FROM
    (
        SELECT MAX(rn) OVER () AS max_rn, SALARY, RN FROM 
        (SELECT
            SALARY,
            DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RN
        FROM EMPLOYEE
        )
    )
)