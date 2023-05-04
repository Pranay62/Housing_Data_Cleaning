**Nashville Housing Data Cleaning Project**

This project aims to clean the Nashville Housing dataset by standardizing date formats, populating null values for property addresses, 
breaking down property and owner addresses into individual columns, removing duplicates, and deleting unused columns.

**Dataset**

The dataset used in this project is the Nashville Housing dataset. It contains information about housing sales in Nashville from 2013 to 2018.

**Queries**

The queries used to clean the dataset are as follows:

1. Standardize Date Format:
              
              Converts the SaleDate column into a standardized date format.
              
2. Populate Property Address Data for Null from ParcelID:
              
              Populates the PropertyAddress column with the value from the corresponding row with the same ParcelId.
              
3. Breaking out Address into Individual Columns (Address, City, State):
              
              Breaks down the PropertyAddress column into individual columns for Address, City, and State.

4. Owner Address Split:
              
              Breaks down the OwnerAddress column into individual columns for Address, City, and State.

5. Sold As Vacant Standardization:
              
              Standardizes the values in the SoldAsVacant column to either "Yes" or "No".

6. Remove Duplicate Rows:
              
              Removes duplicate rows in the dataset.

7. Delete Unused Columns:
              Deletes the OwnerAddress, TaxDistrict, PropertyAddress, and SaleDate columns from the dataset.


**Instructions**

To use these queries, open SQL Server Management Studio and connect to the database where the Nashville Housing dataset is stored. 
Copy and paste the queries into the query editor and execute them one by one.

**Note**: These queries are specific to the Nashville Housing dataset and may need to be modified for use with other datasets.
