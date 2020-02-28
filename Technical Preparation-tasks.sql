select * from Property
select * from OwnerProperty
SELECT * From PropertyType
select * from PropertyOwnerReview
select * from Address
select * from PropertyHomeValue
--a.Display a list of all property names and their property id’s for Owner Id: 1426.

SELECT o.PropertyId,p.Name
From 
OwnerProperty as o 
JOIN Property AS p on o.PropertyId=p.Id
where o.OwnerId=1426

--b.Display the current home value for each property in question a).

SELECT p.Id,p.Name,f.CurrentHomeValue
From 
OwnerProperty as o 
JOIN Property AS p on o.PropertyId=p.Id
JOIN PropertyFinance as f on p.Id=f.PropertyId
where o.OwnerId=1426


--c. For each property in question a), return the following:                                                                      
--i. Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query that returns the sum of all payments from start date to end date. 
--use propertyRentalpayment, tenantproperty,tenantpropertyexpairtmp

select o.OwnerId,tp.PaymentAmount,tpf.Code,tp.StartDate,tp.EndDate,
	IIf(tpf.id=1, tp.PaymentAmount*Datediff(week,tp.StartDate,tp.Enddate), 
	IIF(tpf.id=2, tp.PaymentAmount*(Datediff(week,tp.StartDate,tp.Enddate)/2),(tp.PaymentAmount*(Datediff(month,tp.StartDate,tp.Enddate)+1)))) as SumOfPayment 
from OwnerProperty as o 
join TenantProperty as tp on o.PropertyId=tp.PropertyId
join TenantPaymentFrequencies as tpf on tp.PaymentFrequencyId=tpf.Id
where o.OwnerId=1426

--ii. Display the yield.

select o.OwnerId,pf.Yield
from OwnerProperty as o 
join PropertyFinance as pf on o.PropertyId=pf.PropertyId
where o.OwnerId=1426

--c. For each property in question a), return the following:                                                                      
--i. Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query that returns the sum of all payments from start date to end date. use propertyRentalpayment, tenantproperty,tenantpropertyexpairtmp
--ii. Display the yield.

select o.OwnerId,tp.PaymentAmount,tpf.Code,tp.StartDate,tp.EndDate,o.OwnerId,pf.Yield,
	IIf(tpf.id=1, tp.PaymentAmount*Datediff(week,tp.StartDate,tp.Enddate), 
	IIF(tpf.id=2, tp.PaymentAmount*(Datediff(week,tp.StartDate,tp.Enddate)/2),(tp.PaymentAmount*(Datediff(month,tp.StartDate,tp.Enddate)+1)))) as SumOfPayment 
from OwnerProperty as o 
join TenantProperty as tp on o.PropertyId=tp.PropertyId
join TenantPaymentFrequencies as tpf on tp.PaymentFrequencyId=tpf.Id
join PropertyFinance as pf on o.PropertyId=pf.PropertyId
where o.OwnerId=1426


--d.Display all the jobs available in the marketplace (jobs that owners have advertised for service suppliers).
select JobDescription
FROM Job
where JobEndDate is NULL AND JobDescription like '%service%'

--e. Display all property names, current tenants first and last names and rental payments, per week/ fortnight/month for the properties in question a).

select o.OwnerId,ppt.Name as PropertyName,p.FirstName as CurrentTenats_FirstName,p.LastName as CurrentTenats_LastName,tp.PaymentAmount as Rental_payments,tpf.Code as RentalFrequencies 
from OwnerProperty as o 
join TenantProperty as tp on o.PropertyId=tp.PropertyId
join TenantPaymentFrequencies as tpf on tp.PaymentFrequencyId=tpf.Id
join PropertyFinance as pf on o.PropertyId=pf.PropertyId
join Property as ppt on ppt.Id=o.PropertyId
join person as p on p.Id=tp.TenantId
where o.OwnerId=1426
