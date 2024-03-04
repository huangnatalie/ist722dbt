
  
    

        create or replace transient table analytics.northwind_northwind.dim_date
         as
        (select
    datekey::int as datekey,
    date,
    year,
    month,
    quarter,
    day,
    dayofweek,
    weekofyear,
    dayofyear,
    quartername,
    monthname,
    dayname,
    weekday
    from raw.conformed.DateDimension
        );
      
  