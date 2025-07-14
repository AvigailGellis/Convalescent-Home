--I need a list of all clients who stayed in a Deluxe room and payed more than $500
select * 
from patient p
where p.RoomLevel = 'Deluxe' and p.Cost > 500

--I need a list of all clients who gave birth to a female
select * 
from patient p
where p.BabyGender = 'Female'

--I need a list of all clients gave stayed in the home during the month of July
select * 
from patient p
where datepart(month, p.StartDate) = 7 or datepart(month, p.EndDate) = 7

--Show me the average length of stay for clients in a Standard room
select AvgLengthOfStay = avg(datediff(day, p.StartDate, p.EndDate))
from patient p
where p.RoomLevel = 'Standard'

--Show the amount of days that each client stayed at the hotel.
select FirstName, LastName, DaysStayed = datediff(day, p.StartDate, p.EndDate) 
from  patient p