# Classic Models Inc. database

## About 

The present version was adapted from the MySQL version to SQLite. 

The Classic Models Inc. example database has been developed as part of the 
Eclipse BIRT (Business Intelligence Reporting Tools) project. 

Its main goal is to be obvious and simple, yet able to support a wide range ofinteresting report examples. 
The database represents a fictitious company: Classic Models Inc. which buys collectable model cars, 
trains, trucks, buses, trains and ships directly from manufacturers 
and sells them to distributors across the globe.

And extensive description of the dataset can be found [here](https://www.richardtwatson.com/dm6e/Reader/ClassicModels.pdf). 

## Database schema

The database consists of eight tables:
* Offices: sales offices.
* Employees: All employees, including sales reps who work with customers.
* Customers: All customers. 
* Orders: Orders placed by customers.
* Order Details: Line items within an order.
* Payments: Payments made by customers against their account.
* Products: The list of scale model cars.
* Product Lines: The list of product line classifcation.

## Relational model 

![relational database](model/relational-model.png)

*Fig 1. Classic models Inc. database relational model*

## TODO

Add indices and a list of practice questions. 

## Practice 

Practice questions can be found [here](https://www.richardtwatson.com/dm6e/Reader/ClassicModels.html) 
