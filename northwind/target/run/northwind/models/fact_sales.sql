
  
    

        create or replace transient table analytics.northwind_northwind.fact_sales
         as
        (with stg_sales as 
(
    select
        saleskey,
        md5(cast(coalesce(cast(employeeid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as employeeid,
        md5(cast(coalesce(cast(customerid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customerid,
        md5(cast(coalesce(cast(productid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as productid,
        replace(to_date(OrderDate)::varchar, '-', '')::int as orderdate,
        orderid,
        quantity,
        UnitPrice as extendedpriceamount,
        Discount * UnitPrice * Quantity as discountamount,
        (UnitPrice * Quantity) - (Discount * UnitPrice * Quantity) as soldamount
    from raw.northwind.Order_Details
),
stg_products as
(
    select * from raw.northwind.Products
),
stg_employees as
(
    select * from raw.northwind.Employees
),
stg_customers as
(
    select * from raw.northwind.Customers
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
        );
      
  