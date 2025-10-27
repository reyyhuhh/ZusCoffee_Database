--4 query FR
COLUMN PE_Nationality FORMAT A15
COLUMN O_Date FORMAT A10
COLUMN Method FORMAT A10
COLUMN FeedBackRating FORMAT 9999
COLUMN PromotionInfluence FORMAT A10
COLUMN Email FORMAT A25
COLUMN Tier FORMAT A10
COLUMN Type FORMAT A10
SET PAGESIZE 50;
SET LINESIZE 200;
SELECT
    pe.PE_Nationality,
    o.O_Date,
    p.P_Method AS Method,
    cf.CF_Rating AS FeedBackRating,
    pr.PR_Influence AS PromotionInfluence,
    ar.AR_Email AS Email,
    lp.LP_Tier AS Tier,
    gc.GC_Type AS Type
FROM Person pe
JOIN Orders o ON pe.PE_ID = o.PE_ID 
JOIN Person_Payment pp ON pe.PE_ID = pp.PE_ID
JOIN Payment p ON pp.P_ID = p.P_ID  
JOIN Person_CustomerFeedback pcf ON pe.PE_ID = pcf.PE_ID
JOIN CustomerFeedback cf ON pcf.CF_ID = cf.CF_ID
JOIN Person_Promotions ppr ON pe.PE_ID = ppr.PE_ID
JOIN Promotions pr ON ppr.PR_ID = pr.PR_ID
JOIN Person_AppRegistration par ON pe.PE_ID = par.PE_ID
JOIN AppRegistration ar ON par.AR_ID = ar.AR_ID
JOIN Person_LoyaltyProgram plp ON pe.PE_ID = plp.PE_ID
JOIN LoyaltyProgram lp ON plp.LP_ID = lp.LP_ID
JOIN Person_GiftCards pgc ON pe.PE_ID = pgc.PE_ID
JOIN GiftCards gc ON pgc.GC_ID = gc.GC_ID
WHERE p.P_Method = 'Card'  
AND cf.CF_Rating >= 3 
AND pr.PR_Influence IN ('High', 'Medium')
AND lp.LP_Tier IN ('Silver', 'Gold') 
ORDER BY o.O_Date DESC;
