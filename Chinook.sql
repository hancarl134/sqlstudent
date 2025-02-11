SELECT 
    i.CustomerID
    ,SUM(i.Total) AS InvoiceTotal
INTO #topcust
FROM
Invoice i
GROUP BY i.CustomerId
HAVING SUM(i.Total) > 45

SELECT * from #topcust JOIN Customer C on c.CustomerId = #topcust.CustomerId

-- small simple steps, intermediate tables instead of convoluted multi-step query