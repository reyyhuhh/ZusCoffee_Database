--view
DROP VIEW view_table;
CREATE VIEW view_table AS 
SELECT
e.E_ID,
m.MA_ID,
ep.EP_ID
FROM Employee e
JOIN Manager m ON e.E_ID = m.E_ID
JOIN EmployeePerformance ep ON e.E_ID = ep.E_ID
WHERE ep.EP_Rating > 4;

SELECT * FROM view_table;