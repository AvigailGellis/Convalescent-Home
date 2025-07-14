use ConvalescentHomeDB
drop table if exists Patient 
go
create table dbo.Patient(
    PatientId int not null identity primary key,  
    FirstName varchar(35) not null  constraint ck_patient_firstname_not_blank check (FirstName <> ''),    
    LastName varchar(100) not null constraint ck_patient_lastname_not_blank check (LastName <> ''),   
    StartDate date not null  constraint ck_patient_StartDate_must_be_after_the_year_201 check (StartDate >= '2010-01-01'),  
    EndDate date,
    BabyGender varchar(10) not null constraint ck_patient_BabyGender_male_or_female check (BabyGender in ('Male', 'Female')),
    RoomLevel varchar(20) not null constraint ck_patient_RoomLevel_either_standard_superior_or_deluxe check (RoomLevel in ('Standard', 'Superior', 'Deluxe')),
--AS Instructions on room number wasn't so clear, I followed the instructions but not the examples (your numbering was off). Let me know if I misunderstood.
    RoomNumber int not null constraint ck_roomnumber_valid check (len(RoomNumber) = 3 and substring(convert(varchar(3),RoomNumber),2,2) between 1 and 30),   
    Cost as case 
                when EndDate > getdate() then null 
                else
                    case RoomLevel
                        when 'Standard' then 100
                        when 'Superior' then 150
                        when 'Deluxe' then 200
                    end * (datediff(day, StartDate, EndDate))
            end,
    constraint ck_patient_RoomLevel_and_RoomNumber_match_up check((RoomLevel = 'Standard' and substring(convert(varchar(3),RoomNumber),2,2) between 1 and 10) 
                                                               or (RoomLevel = 'Superior' and substring(convert(varchar(3),RoomNumber),2,2) between 11 and 20) 
                                                               or (RoomLevel = 'Deluxe' and substring(convert(varchar(3),RoomNumber),2,2) between 21 and 30))
)
go
