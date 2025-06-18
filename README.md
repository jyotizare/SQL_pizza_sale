# SQL_pizza_sale_analysis
Pizza sales data analysis using MySQL. The analysis is based on four CSV files that were imported into a MySQL server. The files and their respective columns are as follows:

1. order_details: order_details_id, order_id, pizza_id, quantity

2. orders: order_id, date, time

3. pizzas: pizza_type_id, name, category, ingredients

4. pizza_types: pizza_id, pizza_type_id, size, price

The project addresses various analytical questions through MySQL queries, which are categorized into Basic, Intermediate, and Advanced levels.

Basic Questions:

1. Retrieve the total number of orders placed.

2. Calculate the total revenue generated from pizza sales.

3. Identify the highest-priced pizza.

4. Identify the most common pizza size ordered.

5. List the top 5 most ordered pizza types along with their quantities.

Intermediate Questions:

6. Join the necessary tables to find the total quantity of each pizza category ordered.

7. Determine the distribution of orders by hour of the day.

8. Join relevant tables to find the category-wise distribution of pizzas.

9. Group the orders by date and calculate the average number of pizzas ordered per day.

10. Determine the top 3 most ordered pizza types based on revenue.

Advanced Questions:

11. Calculate the percentage contribution of each pizza type to total revenue.

12. Analyze the cumulative revenue generated over time.

13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

The MySQL queries addressing these questions are included in the Solutions file.

Usage

Run the queries from the Solutions.pdf file to get the desired analysis.

Contributing

Contributions are welcome! Please fork the repository and use a feature branch. Pull requests are reviewed on a regular basis.
