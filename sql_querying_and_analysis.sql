USE online_retail;
SELECT COUNT(*) FROM online_retail_data;
select*from online_retail_data;

select description, round(sum(TotalAmount),2) as Revenue
from online_retail_data
where (IsRefund='False' AND ProductType='Product')
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

select abs(round(sum(TotalAmount),2))
from online_retail_data
where IsRefund='True' and ProductType='Product'
AND Description NOT IN (
        'AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE'
    );

ALTER TABLE online_retail_data
ADD COLUMN ProductType VARCHAR(20);
SET SQL_SAFE_UPDATES = 0;


UPDATE online_retail_data
SET ProductType = CASE
    WHEN LOWER(Description) LIKE '%postage%'
      OR LOWER(Description) LIKE '%dotcom%'
      OR LOWER(Description) LIKE '%manual%'
      OR LOWER(Description) LIKE '%test%'
    THEN 'Service'
    ELSE 'Product'
END;

select ProductType, count(*)
from online_retail_data
group by ProductType;

select round(sum(TotalAmount),2) from online_retail_data where IsRefund='False' and ProductType='Product';
select round(avg(TotalAmount),2) as averageTransaction
from online_retail_data
where IsRefund='False';

select InvoiceMonth,round(sum(TotalAmount),2) as TotalRevenueInThisMonth
from online_retail_data
where IsRefund='False'
Group by InvoiceMonth
Order by TotalRevenueinThisMonth Desc;

select CustomerType, count(*) as Orders, round(sum(TotalAmount),2) as TotalRevenue
from online_retail_data
where IsRefund='False' and ProductType='Product'
Group by CustomerType
Order by TotalRevenue desc;

select CustomerId, round(sum(TotalAmount),2) as TotalRevenue, ((sum(TotalAmount)/10311564.64)*100) as percentage_to_total_revenue
from online_retail_data
where CustomerType!='Guest' and IsRefund='False'

Group by CustomerID
Order by TotalRevenue desc
Limit 5;

select round(sum(TotalAmount),2) as TotalMoneyRefunded
from online_retail_data
where IsRefund='True' and ProductType='Product'
AND Description NOT IN (
        'AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE'
    );

select description,  abs(round(sum(TotalAmount),2)) as MoneyRefundedForThisProduct
from online_retail_data

where IsRefund='True' and ProductType='Product'
AND Description NOT IN (
        'AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE'
    )
Group by Description
Order by MoneyRefundedForThisProduct desc
Limit 10;

select InvoiceWeekday, abs(round(sum(TotalAmount),2)) as TotalRefundsOnThisDay, abs((sum(TotalAmount)/479244.29))*100 as Percentage_Refund
from online_retail_data

where IsRefund='True' and ProductType='Product'
And description NOT IN('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')

Group by InvoiceWeekday
Order by TotalRefundsOnThisDay desc;

select InvoiceWeekday, round(sum(TotalAmount),2) as RevenueGenerated ,((sum(TotalAmount)/10311564.64)*100) as percentage_of_total_revenue
from online_retail_data
where IsRefund='False' and ProductType='Product'
and description NOT IN('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
Group by InvoiceWeekday
order by RevenueGenerated desc;

select InvoiceHour, round(sum(TotalAmount),2) as RevenueGenerated ,((sum(TotalAmount)/10311564.64)*100) as percentage_of_total_revenue
from online_retail_data
where IsRefund='False' and ProductType='Product'
and description NOT IN('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
Group by InvoiceHour
order by RevenueGenerated desc;

select Country, round(sum(TotalAmount),2) as TotalRevenue
from online_retail_data
where IsRefund='False'
-- and ProductType='Product'
and description NOT IN('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
Group by Country
order by TotalRevenue desc;

select Country, round(sum(TotalAmount),2) as TotalRefund
from online_retail_data
where IsRefund='True'
and ProductType='Product'
and description NOT IN('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
Group by Country
order by TotalRefund asc;

SELECT
    r.Country,
    ROUND(r.TotalRefund, 2) AS TotalRefund,
    ROUND(s.TotalRevenue, 2) AS TotalRevenue,
    ROUND((ABS(r.TotalRefund) / s.TotalRevenue) * 100, 2) AS RefundRatePercent
FROM
    (
        SELECT Country, SUM(TotalAmount) AS TotalRefund
        FROM online_retail_data
        WHERE IsRefund = 'True'
        AND ProductType = 'Product'
        AND Description NOT IN ('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
        GROUP BY Country
    ) r
JOIN
    (
        SELECT Country, SUM(TotalAmount) AS TotalRevenue
        FROM online_retail_data
        WHERE IsRefund = 'False'
        AND ProductType = 'Product'
        AND Description NOT IN ('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
        GROUP BY Country
    ) s
ON r.Country = s.Country
ORDER BY RefundRatePercent DESC;

select s.description,
round(s.TotalRevenue,2) as Revenue,
round(r.TotalRefund,2) as Refund,
round(abs(TotalRefund/TotalRevenue)*100,2)  AS RefundRatePercentage

FROM(
 SELECT Description, SUM(TotalAmount) AS TotalRevenue
        FROM online_retail_data
        WHERE IsRefund = 'False'
          AND ProductType = 'Product'
          AND Description NOT IN ('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
        GROUP BY Description
    ) s
JOIN(
SELECT Description, SUM(TotalAmount) AS TotalRefund
        FROM online_retail_data
        WHERE IsRefund = 'True'
          AND ProductType = 'Product'
          AND Description NOT IN ('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
        GROUP BY Description
    ) r
ON s.Description=r.Description
HAVING RefundRatePercentage>5
order by RefundRatePercentage desc;

SELECT Country, abs(SUM(TotalAmount)) AS TotalRefund
        FROM online_retail_data
        WHERE IsRefund = 'True'
        AND ProductType = 'Product'
        AND Description NOT IN ('AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE')
        GROUP BY Country
        LIMIT 10;

SELECT Description, SUM(TotalAmount) AS Revenue
FROM online_retail_data
WHERE IsRefund = 'False'
  AND ProductType = 'Product'
  AND Description NOT IN (
    'AMAZON FEE', 'CRUK Commission', 'Bank Charges', 'Discount', 'Manual', 'POSTAGE'
  )
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;





