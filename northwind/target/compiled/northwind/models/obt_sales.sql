with f_order_sales as (
    select * from analytics.northwind_northwind.fact_order_fulfillment
),
d_customer as (
    select * from analytics.northwind_northwind.dim_customer
),
d_employee as (
    select * from analytics.northwind_northwind.dim_employee
),
d_date as (
    select * from analytics.northwind_northwind.dim_date
)
select 
    d_customer.*, 
    d_employee.*, 
    d_date.*,
    f.saleskey, f.employeeid, f.customerid, f.orderdate, f.productid, f.orderid, f.quantity, f.extendedpriceamount, f.discountamount, f.soldamount
from f_order_fulfillment as f
left join d_customer on f.customerid = d_customer.customerid
left join d_employee on f.employeeid = d_employee.employeeid
left join d_date on f.orderdate = d_date.date