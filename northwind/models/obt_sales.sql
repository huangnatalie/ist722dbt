with f_sales as (
    select * from {{ ref('fact_sales') }}
),
d_customer as (
    select * from {{ ref('dim_customer') }}
),
d_employee as (
    select * from {{ ref('dim_employee') }}
),
d_date as (
    select * from {{ ref('dim_date') }}
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