select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select date
from analytics.northwind_northwind.dim_date
where date is null



      
    ) dbt_internal_test