select * from Property
select * from OwnerProperty
SELECT * From PropertyType
select * from PropertyOwnerReview
select * from Address


--Display a list of all property names and their property id¡¯s for Owner Id: 1426.

SELECT o.OwnerId,o.PropertyId,t.Name
From 
OwnerProperty as o 
JOIN Property AS p on o.PropertyId=p.Id
JOIN PropertyType AS t on p.PropertyTypeId=t.PropertyTypeId
where o.OwnerId=1426



Where