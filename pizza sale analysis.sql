-- Q1. Retrieve the total number of order placed

select count(order_id) as total_order from orders;

-- Q.2 Calculate the total revenue generated from pizza sale.

SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id
    
-- Q.3 Identify the hoghest-priced pizza.

SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- Q.4 Identify the most common pizza size orderd.

select pizzas.size, count(orders_details.order_details_id) as order_count
from pizzas join orders_details
on pizzas.pizza_id = orders_details.pizza_id
group by pizzas.size order by order_count desc ;

-- Q.5 List the top 5 most orderd pizza type along with their quantities.

select pizza_types.name,
sum(orders_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details 
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by quantity desc limit 5;

-- Q.6 Join the necessary tables to find the total quantity of each pizza category.

select pizza_types.category,
sum(orders_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details 
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by quantity desc;

-- Q.7 Determine the distribution of orders by hours of the day. 

select hour(order_time) as hour, count(order_id) as order_count from orders
group by hour(order_time);
-- order by order_count desc ;

-- Q.8 Join the relevant table to find category wise distribution of pizzas.

select category , count(name) from pizza_types
group by category;

-- Q.9 group the order by date and calculate the average number of pizzas ordered per day. 

select round(avg(quantity),0) as avg_pizzas_ordered_per_day from
(select orders.order_date, sum(orders_details.quantity) as quantity
from orders join orders_details
on orders.order_id = orders_details.order_id
group by orders.order_date) as order_quantity;

-- Q.10 Determine the top 3 most ordered pizza based on revenue.

select pizza_types.name,
sum(orders_details.quantity*pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details 
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3;

-- Q.11 Calculate the percentage contribution of each pizza type to the total revenue

select pizza_types.category,
round(sum(orders_details.quantity*pizzas.price) / (SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id)* 100 ,2) as revenue
    from pizza_types join pizzas
    on pizza_types.pizza_type_id = pizzas.pizza_type_id
    join orders_details
    on orders_details.pizza_id = pizzas.pizza_id
    group by pizza_types.category order by revenue desc ;

-- Q.12 Analyse the cumulative revenue generated over time 

select order_date,
sum(revenue) over (order by order_date) as cum_revenue
from
(select orders.order_date,
sum(orders_details.quantity*pizzas.price)as revenue
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id
join orders
on orders.order_id = orders_details.order_id
group by orders.order_date) as sales;

-- Q.13 Determine the top 3 most ordered pizza type based on the revenue for each pizza category. 

select name,revenue from
(select category,name, revenue,
rank() over (partition by category order by revenue desc )  as rn
from
(select pizza_types.category, pizza_types.name,
sum((orders_details.quantity) * pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as a) as b
where rn <= 3 ;






