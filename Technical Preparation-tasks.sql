select * from Property
select * from OwnerProperty
SELECT * From PropertyType
select * from PropertyOwnerReview
select * from Address
select * from PropertyHomeValue

--a.Display a list of all property names and their property id¡¯s for Owner Id: 1426.

SELECT o.OwnerId,o.PropertyId,t.Name
From 
OwnerProperty as o 
JOIN Property AS p on o.PropertyId=p.Id
JOIN PropertyType AS t on p.PropertyTypeId=t.PropertyTypeId
where o.OwnerId=1426


--Display the current home value for each property in question a).
SELECT o.OwnerId,o.PropertyId,t.Name,f.CurrentHomeValue
From 
OwnerProperty as o 
JOIN Property AS p on o.PropertyId=p.Id
JOIN PropertyType AS t on p.PropertyTypeId=t.PropertyTypeId
JOIN PropertyFinance as f on o.PropertyId=f.PropertyId
where o.OwnerId=1426
