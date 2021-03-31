# loadsmart data challenge

##### Hi, I'm Cesar Santos, I'm 22 years old and I love working with **Data!**

This project was created to solve a data challenge from loadsmart, it is end-to-end data solution. Starting with a data extraction from a regular excel file, transforming the data according to a star schema model, and transports it to a Data Warehouse in a localhost MySQL DB. Finally a Power BI report was created to consume this treated data, allowing a deep and performatic analyzes from business users.

The DW model is available below:
![MER](https://github.com/cesaraugusto98/loadsmart/blob/develop/documentation/loadsmart_diagram-MER.png?raw=true)

Follow these steps to run this project smoothly:
* 1 - Start a localhost MySQL Database ([XAMPP](https://www.apachefriends.org/pt_br/index.html) is a good option);
* 2 - Clone this repository;
* 3 - Install the required libs from [requirements.txt](https://github.com/cesaraugusto98/loadsmart/blob/develop/python/requirements.txt) file available inside python folder;
* 4 - Run [DDL_LOADSMART_DW_LOCALHOST.sql](https://github.com/cesaraugusto98/loadsmart/blob/develop/database/DDL_LOADSMART_DW_LOCALHOST.sql) at MySQL to create the DW database, tables, and the respective users;
* 5 - Run all cells from the [ETL_Python.ipynb](https://github.com/cesaraugusto98/loadsmart/blob/develop/python/ETL_Python.ipynb) jupyter notebook;
* 6 - Grab a cup of **coffee** while the ETL_Python.ipynb is running;
* 7 - Open the [Loadsmart General Dashboard.pbix](https://github.com/cesaraugusto98/loadsmart/blob/develop/powerbi/Loadsmart%20General%20Dashboard.pbix) and refresh the data;
* 	7.1 - If you face a problem with MySQL connector, I've uploaded the MySQL Conector installer inside the powerbi folder;
* 8 - Now you are ready to deep dive into the data.

##### I'm available for questions, possible fixes and most import to improve this solution.
