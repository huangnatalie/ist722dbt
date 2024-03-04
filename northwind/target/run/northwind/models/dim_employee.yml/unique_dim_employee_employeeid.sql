select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    employeeid as unique_field,
    count(*) as n_records

from analytics.northwind_northwind.dim_employee
where employeeid is not null
group by employeeid
having count(*) > 1



      
    ) dbt_internal_test