use ConvalescentHomeDB
go
insert Patient (FirstName, LastName, StartDate, EndDate, BabyGender, RoomLevel, RoomNumber)
select 'jane', 'doe',  '2012-07-24',  '2012-07-28', 'Male', 'Superior', 215
union select 'susan', 'smith',  '2020-06-12',  '2020-06-14', 'Female', 'Standard', 109
union select 'eva', 'jones',  '2015-01-20',  '2015-01-27', 'Female', 'Deluxe', 424
union select 'emily', 'brown',  '2024-03-13',  '2024-03-17', 'Male', 'Standard', 303
union select 'elizabeth', 'miller',  '2025-07-18',  '2025-07-19', 'Male', 'Standard', 309
union select 'karen', 'williams',  '2019-11-21',  '2019-11-23', 'Female', 'Deluxe', 428
