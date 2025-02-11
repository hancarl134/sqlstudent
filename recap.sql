/*
Foundation Recap Exercise

Use the table PatientStay.  
This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024
*/

SELECT
	*
FROM
	PatientStay ps ;

/*
1. List the patients -
a) in the Oxleas or PRUH hospitals and
b) admitted in February 2024
c) only the Surgery wards

2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.
3. Order results by AdmittedDate (latest first) then PatientID column (high to low)
4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.
*/

-- Write the SQL statement here
SELECT  ps.PatientID
        ,ps.AdmittedDate
        ,ps.DischargeDate
        ,ps.Hospital
        ,ps.Ward
        ,DATEDIFF(DAY,ps.AdmittedDate,ps.DischargeDate)+1 as 'LengthofStay'
        ,DATEADD(WEEK,-2,ps.AdmittedDate) AS 'REMINDER DATE'
FROM
	PatientStay ps 
WHERE ps.Hospital in ('Oxleas','PRUH') 
    and ps.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-29'
    and ps.Ward LIKE '%Surgery'

ORDER BY ps.AdmittedDate DESC, ps.PatientId DESC;

/*
5. How many patients has each hospital admitted? 
6. How much is the total tarriff for each hospital?
7. List only those hospitals that have admitted over 10 patients
8. Order by the hospital with most admissions first
*/

-- Write the SQL statement here

SELECT
    ps.Hospital,
    COUNT(*) as NumberOfPatients
    , SUM(ps.Tariff) AS TotalTariff
FROM PatientStay ps
GROUP BY ps.Hospital
HAVING NumberOfPatients > 10
ORDER BY NumberOfPatients DESC

/*-----------------------------------------*/

select * from DimHospital
select * from PatientStay

SELECT  
    ps.PatientID
    , ps.AdmittedDate
    , h.Type
    , h.Hospital 

FROM PatientStay ps 
LEFT JOIN DimHospital h on ps.Hospital = h.Hospital -- by default an inner join
WHERE h.[Type] = 'Teaching'
or h.[Type] IS NULL

--Inner and Left join notes, by default, a join is an inner join that returns results where there's a match in both tables. 
--The left table is the one before the join, it's a matter of order in the statement. 
--So a Left join brings all the results in the first table even if there isn't a match in the second table. 