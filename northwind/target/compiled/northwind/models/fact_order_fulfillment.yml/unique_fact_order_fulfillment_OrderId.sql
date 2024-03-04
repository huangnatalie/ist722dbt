
    
    

select
    OrderId as unique_field,
    count(*) as n_records

from analytics.northwind_northwind.fact_order_fulfillment
where OrderId is not null
group by OrderId
having count(*) > 1


