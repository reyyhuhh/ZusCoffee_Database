--3rd Query - Join Six Tables
SET PAGESIZE 50;
SET LINESIZE 120;
SET TRIMSPOOL ON;

COLUMN PE_ID FORMAT A10;
COLUMN PE_Nationality FORMAT A12;
COLUMN OrderID FORMAT A10;
COLUMN O_Date FORMAT A11;
COLUMN P_Method FORMAT A10;
COLUMN P_Amount FORMAT 99999.99;
COLUMN BranchName FORMAT A15;
COLUMN BranchCity FORMAT A12;
COLUMN FeedbackRating FORMAT 9;
COLUMN CF_Comments FORMAT A30 WORD_WRAPPED;
COLUMN PR_Description FORMAT A35 WORD_WRAPPED;
COLUMN PR_Influence FORMAT A10;


SELECT
    pe.PE_ID,
    pe.PE_Nationality,
    o.O_ID AS OrderID,
    o.O_Date,
    p.P_Method,
    p.P_Amount,
    b.B_Name,
    b.B_City,
    cf.CF_Rating,
    cf.CF_Comments,
    pr.PR_Description,
    pr.PR_Influence
FROM Person pe
JOIN Orders o ON pe.PE_ID = o.PE_ID 
JOIN Person_Payment pp ON pe.PE_ID = pp.PE_ID
JOIN Payment p ON pp.P_ID = p.P_ID  
JOIN Person_Branch pb ON pe.PE_ID = pb.PE_ID
JOIN Branch b ON pb.B_ID = b.B_ID 
JOIN Person_CustomerFeedback pc ON pe.PE_ID = pc.PE_ID
JOIN CustomerFeedback cf ON pc.CF_ID = cf.CF_ID
JOIN Person_Promotions ppr ON pe.PE_ID = ppr.PE_ID
JOIN Promotions pr ON ppr.PR_ID = pr.PR_ID;