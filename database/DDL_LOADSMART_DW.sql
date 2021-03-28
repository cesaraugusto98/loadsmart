DROP TABLE IF EXISTS FactTransport;

DROP TABLE IF EXISTS FactSales;

-- CREATING DIMENSION SHIPPIER
DROP TABLE IF EXISTS DimShipper;

CREATE TABLE DimShipper(
	sk_code INT NOT NULL AUTO_INCREMENT,
	shipper_name VARCHAR(30) NOT NULL,
	last_update DATETIME,
	PRIMARY KEY (sk_code)
);
-- INSERTING UNKNOWN RECORD
INSERT INTO DimShipper(sk_code, shipper_name, last_update) values(-1,'unknown', curtime());

-- CREATING DIMENSION ROUTE
DROP TABLE IF EXISTS DimRoute;

CREATE TABLE DimRoute(
	sk_code INT NOT NULL AUTO_INCREMENT,
	lane VARCHAR(100) NOT NULL,
	source VARCHAR(50),
	destination VARCHAR(50),
	last_update DATETIME,
	PRIMARY KEY (sk_code)
);
-- INSERTING UNKNOWN RECORD
INSERT INTO DimRoute(sk_code, lane, source, destination, last_update) values(-1,'unknown','unknown','unknown', curtime());

-- CREATING DIMENSION CARRIER
DROP TABLE IF EXISTS DimCarrier;

CREATE TABLE DimCarrier(
	sk_code INT NOT NULL AUTO_INCREMENT,
	carrier_name VARCHAR(100) NOT NULL,
	carrier_rating SMALLINT,
	fl_vip_carrier BOOLEAN,
	fl_has_mobile_app_tracking BOOLEAN,
	fl_has_macropoint_tracking BOOLEAN,
	fl_has_edi_tracking BOOLEAN,
	last_update DATETIME,
	PRIMARY KEY (sk_code)
);
-- INSERTING UNKNOWN RECORD
INSERT INTO DimCarrier(sk_code, carrier_name,last_update) values(-1,'unknown', curtime());

-- CREATING DIMENSION LOAD
DROP TABLE IF EXISTS DimLoad;

CREATE TABLE DimLoad(
	sk_code INT NOT NULL AUTO_INCREMENT,
	loadsmart_id BIGINT NOT NULL,
	sourcing_channel VARCHAR(30),
	equipment_type VARCHAR(3),
	fl_contracted_load BOOLEAN,
	fl_load_booked_autonomously BOOLEAN,
	fl_load_sourced_autonomously BOOLEAN,
	fl_load_was_cancelled BOOLEAN,
	last_update DATETIME,
	PRIMARY KEY (sk_code)
);
-- INSERTING UNKNOWN RECORD
INSERT INTO DimLoad(sk_code, loadsmart_id,sourcing_channel, last_update) values(-1,-1, 'unknown', curtime());


-- CREATING FACT SALES
DROP TABLE IF EXISTS FactSales;

CREATE TABLE FactSales(
	sk_carrier_code INT DEFAULT  -1,
	sk_shipper_code INT DEFAULT  -1,
	sk_load_code INT DEFAULT  -1,
	sk_route_code INT DEFAULT  -1,
	quote_datetime DATETIME,
	book_datetime DATETIME,
	source_datetime DATETIME,
	book_price DOUBLE,
	source_price DOUBLE,
	pnl_value DOUBLE,
	minutes_between_quote_book INT,
	last_update DATETIME,
	FOREIGN KEY (sk_carrier_code) REFERENCES DimCarrier(sk_code),
	FOREIGN KEY (sk_shipper_code) REFERENCES DimShipper(sk_code),
	FOREIGN KEY (sk_load_code) REFERENCES DimLoad(sk_code),
	FOREIGN KEY (sk_route_code) REFERENCES DimRoute(sk_code)
);


-- SELECT * FROM FactSales fct
-- INNER JOIN DimLoad lod on fct.sk_load_code = lod.sk_code
-- where sk_load_code = 117;

-- CREATING FACT Transport
DROP TABLE IF EXISTS FactTransport;

CREATE TABLE FactTransport(
	sk_carrier_code INT DEFAULT  -1,
	sk_shipper_code INT DEFAULT  -1,
	sk_load_code INT DEFAULT  -1,
	sk_route_code INT DEFAULT  -1,
	pickup_datetime DATETIME,
	pickup_appointment_datetime DATETIME,
	delivery_datetime DATETIME,
	delivery_appointment_datetime  DATETIME,
	mileage_value DOUBLE,
	days_between_pickup_delivery INT,
	hours_between_pickup_delivery INT,
	last_update DATETIME,
	FOREIGN KEY (sk_carrier_code) REFERENCES DimCarrier(sk_code),
	FOREIGN KEY (sk_shipper_code) REFERENCES DimShipper(sk_code),
	FOREIGN KEY (sk_load_code) REFERENCES DimLoad(sk_code),
	FOREIGN KEY (sk_route_code) REFERENCES DimRoute(sk_code)
);

-- SELECT * FROM FactTransport fct
-- INNER JOIN DimLoad lod on fct.sk_load_code = lod.sk_code
-- where sk_load_code = 117;
