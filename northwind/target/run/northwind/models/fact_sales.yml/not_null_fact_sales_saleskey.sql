select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select saleskey
from analytics.northwind_northwind.fact_sales
where saleskey is null



      
    ) dbt_internal_test