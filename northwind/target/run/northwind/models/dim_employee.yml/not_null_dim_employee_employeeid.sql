select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select employeeid
from analytics.northwind_northwind.dim_employee
where employeeid is null



      
    ) dbt_internal_test