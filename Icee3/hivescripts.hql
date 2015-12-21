drop table biz;

Create External Table biz (Location_ID string, Business_Account_Number INT, Ownership_Name STRING, DBA_Name STRING, Street_Address STRING, City STRING, State STRING, Zip_Code INT, Business_Start_Date String, Business_End_Date String, Location_Start_Date String, Location_End_Date String, Mail_Address STRING,	Mail_City_State_Zip STRING, Class_Code INT, PBC_Code INT, Business_Location STRING)
row format delimited FIELDS TERMINATED BY ","
Location "wasb://icee@andrewmdev.blob.core.windows.net/Data";

select * from biz limit 1;


//businesses in sf
select city , count(distinct(business_account_number)) as num from biz group by city order by num desc;


//new locations only
select city, count(business_account_number ) as num 
from biz 
where SUBSTR(location_start_date,6,4)='2015' and SUBSTR(business_start_date,6,4)<>'2015'  
group by city order by num desc;



//all new businesses/locations
select city , count(business_account_number ) as num 
from biz 
where SUBSTR(location_start_date,6,4)='2015'
group by city order by num desc;






