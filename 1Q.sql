--1st Query- Join Two Tables
SET PAGESIZE 50;
SET LINESIZE 200;
SELECT
	b.B_City AS BranchCity,
	i.I_Notes AS ItemNotes
FROM Branch b
JOIN Inventory I ON b.B_ID = i.B_ID;