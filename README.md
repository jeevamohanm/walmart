# walmart
walmart sales data analysis

## **Project steps**  

###**1. Set Up Kaggle API**

* **API Setup:** Obtain your Kaggle API token from Kaggle by navigating to your profile settings and downloading the JSON file. 

* **Configure Kaggle:** 

   * Place the downloaded kaggle.json file in your local .kaggle folder. 

   * Use the command kaggle datasets download -d <dataset-path> to pull datasets directly into your project. 

### **2. Download Walmart Sales Data** 

* **Data Source:** Use the Kaggle API to download the Walmart sales datasets from Kaggle. 

* **Dataset Link:** Walmart Sales Dataset 

* **Storage:** Save the data in the data/ folder for easy reference and access. 

**3. Install Required Libraries and Load Data** 

* **Libraries:** Install necessary Python libraries using: 

pip install pandas numpy sqlalchemy mysql-connector-python psycopg2 

* **Loading Data:** Read the data into a Pandas DataFrame for initial analysis and transformations. 

**4. Explore the Data** 

* **Goal:** Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues. 

* **Analysis:** Use functions like .info(), .describe(), and .head() to get a quick overview of the data structure and statistics. 

**5. Data Cleaning** 

* **Remove Duplicates:** Identify and remove duplicate entries to avoid skewed results. 

* **Handle Missing Values:** Drop rows or columns with missing values if they are insignificant; fill values where essential. 

* **Fix Data Types:** Ensure all columns have consistent data types (e.g., dates as datetime, prices as float). 

* **Currency Formatting:** Use .replace() to handle and format currency values for analysis. 

* **Validation:** Check for any remaining inconsistencies and verify the cleaned data. 

**6. Feature Engineering**

* **Create New Columns:** Calculate the Total Amount for each transaction by multiplying unit_price by quantity and adding this as a new column. 

* **Enhance Dataset:** Adding this calculated field will streamline further SQL analysis and aggregation tasks. 

**7. Load Data into MySQL** 

* **Set Up Connections:** Connect to MySQL using sqlalchemy and load the cleaned data into each database. 

* **Table Creation:** Set up tables in both MySQL using Python SQLAlchemy to automate table creation and data insertion. 

* **Verification:** Run initial SQL queries to confirm that the data has been loaded accurately. 

**8. SQL Analysis:** Complex Queries and Business Problem Solving 

* **Business Problem-Solving:** Write and execute complex SQL queries to answer critical business questions, such as: 

   * Revenue trends across branches and categories. 

   * Identifying best-selling product categories. 

   * Sales performance by time, city, and payment method. 

   * Analyzing peak sales periods and customer buying patterns. 

   * Profit margin analysis by branch and category. 

* **Documentation:** Keep clear notes of each query's objective, approach, and results. 

**9. Project Publishing and Documentation** 

* **Documentation:** Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook. 

* **Project Publishing:** Publish the completed project on GitHub including: 

   * The README.md file. 

   * Jupyter Notebooks. 

   * SQL query scripts. 

   * Data files. 

