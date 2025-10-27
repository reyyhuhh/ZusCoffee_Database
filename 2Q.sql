--2nd Query (fr)
SET PAGESIZE 50;
SET LINESIZE 200;
SELECT 
    ar.AR_Email AS Email, 
    COUNT(m.M_Category) AS TotalCategories, 
    l.L_Status AS Status, 
    gc.GC_Type AS Type
FROM AppRegistration ar
JOIN AppRegistration_Menu arm ON ar.AR_ID = arm.AR_ID
JOIN Menu m ON arm.M_ID = m.M_ID 
JOIN AppLogin_AppRegistration alar ON ar.AR_ID = alar.AR_ID
JOIN AppLogin l ON alar.L_ID = l.L_ID
JOIN AppRegistration_GiftCards argc ON ar.AR_ID = argc.AR_ID
JOIN GiftCards gc ON argc.GC_ID = gc.GC_ID
WHERE l.L_Status = 'Active'
AND gc.GC_Type = 'Cash'
GROUP BY ar.AR_Email, l.L_Status, gc.GC_Type;
