with stg_sales as 
(
    select
        saleskey,
        {{ dbt_utils.generate_surrogate_key(['employeeid']) }} as employeeid,
        {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customerid,
        {{ dbt_utils.generate_surrogate_key(['productid']) }} as productid,
        replace(to_date(OrderDate)::varchar, '-', '')::int as orderdate,
        orderid,
        quantity,
        UnitPrice as extendedpriceamount,
        Discount * UnitPrice * Quantity as discountamount,
        (UnitPrice * Quantity) - (Discount * UnitPrice * Quantity) as soldamount
    from {{ source('northwind','Order_Details')}}
),
stg_products as
(
    select * from {{ source('northwind','Products')}}
),
stg_employees as
(
    select * from {{ source('northwind','Employees')}}
),
stg_customers as
(
    select * from {{ source('northwind','Customers')}}
)
select
    s.*,
    p.productname,
    e.firstname as employeename,
    c.companyname as customername
from stg_sales s
    join stg_products p on s.productid = p.productid
    join stg_employees e on s.employeeid = e.employeeid
    join stg_customers c on s.customerid = c.customerid