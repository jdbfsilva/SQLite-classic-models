/*
	This is a multi-line comment.
	As you can see, SQL is not case sensitve.
	That is, This is the same of this and the same as tHis.
*/
CREATE TABLE offices (
	-- Note that the primary key here is a string with 10 characters.
	-- Is this a good idea?
	officecode VARCHAR(10) PRIMARY KEY,
	city VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	addressline1 VARCHAR(50) NOT NULL,
	addressline2 VARCHAR(50) DEFAULT NULL,
	state VARCHAR(50) DEFAULT NULL,
	country VARCHAR(50) NOT NULL,
	postalcode VARCHAR(15) NOT NULL,
	territory VARCHAR(10) NOT NULL
);

CREATE TABLE employees (
	employeenumber INTEGER PRIMARY KEY,
	lastname VARCHAR(50) NOT NULL,
	firstname VARCHAR(50) NOT NULL,
	extension VARCHAR(10) NOT NULL,
	email VARCHAR(100) NOT NULL,
	officecode VARCHAR(10) NOT NULL,
	reportsto INTEGER, -- Can reportsto be NULL?
	jobtitle character VARCHAR(50) NOT NULL,
	-- FKs 
	FOREIGN KEY(officecode) 
		REFERENCES offices(officecode)
			ON DELETE CASCADE,
	FOREIGN KEY(reportsto)
		REFERENCES employees(employeenumber)
			ON DELETE CASCADE
);

CREATE TABLE customers (
	customernumber INTEGER PRIMARY KEY,
    customername VARCHAR(50) NOT NULL,
    contactlastname VARCHAR(50) NOT NULL,
    contactfirstname VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressline1 VARCHAR(50) NOT NULL,
    addressline2 VARCHAR(50) DEFAULT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) DEFAULT NULL,
    postalcode VARCHAR(15) DEFAULT NULL,
    country VARCHAR(50) NOT NULL,
    salesrepemployeenumber INTEGER,
    creditlimit REAL CHECK(creditlimit >= 0),
	-- FKs
	FOREIGN KEY(salesrepemployeenumber)
		REFERENCES employees(employeenumber)
			ON DELETE CASCADE
);

CREATE TABLE payments (
	customernumber INTEGER NOT NULL,
	checknumber VARCHAR(50) NOT NULL,
	paymentdate VARCHAR(10) NOT NULL,
	amount REAL NOT NULL,
	-- this is a way to define a composite primary key
	PRIMARY KEY(customernumber, checknumber),
    FOREIGN KEY(customernumber) 
        REFERENCES customers(customernumber) 
            ON DELETE CASCADE
);

CREATE TABLE productlines(
	productline VARCHAR(50) PRIMARY KEY, 
	textdescription TEXT DEFAULT NULL,
	htmldescription TEXT, 
	image BLOB -- This is how we save binary data
);

CREATE TABLE products (
	productcode VARCHAR(15) PRIMARY KEY,
	productname VARCHAR(70) NOT NULL,
	productline VARCHAR(50) NOT NULL,
	productscale VARCHAR(10) NOT NULL,
	productvendor VARCHAR(50) NOT NULL,
	productdescription TEXT NOT NULL,
	quantityinstock REAL NOT NULL,
	buyprice REAL NOT NULL,
	msrp REAL NOT NULL,
	-- FK
	FOREIGN KEY(productline) 
		REFERENCES productlines(productline)
			ON DELETE CASCADE
);

CREATE TABLE orders (
	ordernumber INTEGER PRIMARY KEY,
	orderdate VARCHAR(10) NOT NULL,
	requireddate VARCHAR(10) NOT NULL,
	shippeddate VARCHAR(10),
	status VARCHAR(15) NOT NULL,
	comments TEXT,
	customernumber INTEGER NOT NULL,
	-- FKs
	FOREIGN KEY(customernumber) 
		REFERENCES customers(customernumber)
			ON DELETE CASCADE
);

CREATE TABLE orderdetails (
	ordernumber INTEGER NOT NULL,
	productcode VARCHAR(15) NOT NULL,
	quantityordered INTEGER NOT NULL,
	priceeach REAL NOT NULL,
	orderlinenumber INTEGER NOT NULL,
	-- PK
	PRIMARY KEY(ordernumber, productcode)
);


