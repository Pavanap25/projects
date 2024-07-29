-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category, Sum(order_details.quantity) as quantity from
pizzas join order_details 
on pizzas.pizza_id=order_details.pizza_id
join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id 
group by category order by quantity desc;

-- Determine the distribution of orders by hour of the day
Select hour(order_time), count(order_id)
from orders group by hour(order_time) ;

-- Join relevant tables to find the category wise distribution of pizzas.
Select category, count(name) from pizza_types
group by category;

-- Group the orders by the date and calculate the average number of pizzas ordered per day.

Select avg(quantity) from
(select orders.order_date, sum(order_details.quantity) as quantity from orders join order_details on
orders.order_id= order_details.order_id
group by orders.order_date) as avg_pizza;
 
 -- Determine the top 3 most ordered Pizza types based on revenue

select pizza_types.category, round(sum(pizzas.price*order_details.quantity), 2) as quantity
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
group by pizza_types.category order by quantity desc limit 3;