
    
    

select
    datekey as unique_field,
    count(*) as n_records

from analytics.northwind_northwind.dim_date
where datekey is not null
group by datekey
having count(*) > 1


