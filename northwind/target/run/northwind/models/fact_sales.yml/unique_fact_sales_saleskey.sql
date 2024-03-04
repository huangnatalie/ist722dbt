select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    saleskey as unique_field,
    count(*) as n_records

from analytics.northwind_northwind.fact_sales
where saleskey is not null
group by saleskey
having count(*) > 1



      
    ) dbt_internal_test