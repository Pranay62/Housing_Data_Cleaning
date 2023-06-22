## Nashville Housing Data Cleaning Project

This project focuses on cleaning the Nashville Housing dataset by performing various data cleaning tasks. The dataset contains information about housing sales in Nashville from 2013 to 2018. The goal is to standardize date formats, populate null values for property addresses, break down addresses into individual columns, remove duplicates, and delete unused columns.

## Dataset

The dataset used in this project is the Nashville Housing dataset, which provides details about housing sales in Nashville. It includes information such as property addresses, owner addresses, sale dates, and other relevant data.

## Queries

The following queries are used to clean the dataset:

1. Standardize Date Format:
   - Converts the SaleDate column into a standardized date format.

2. Populate Property Address Data for Null from ParcelID:
   - Populates the PropertyAddress column with the corresponding address value based on the ParcelId.

3. Breaking out Address into Individual Columns (Address, City, State):
   - Breaks down the PropertyAddress column into separate columns for address, city, and state.

4. Owner Address Split:
   - Breaks down the OwnerAddress column into separate columns for address, city, and state.

5. Sold As Vacant Standardization:
   - Standardizes the values in the SoldAsVacant column to either "Yes" or "No".

6. Remove Duplicate Rows:
   - Removes duplicate rows from the dataset.

7. Delete Unused Columns:
   - Deletes the OwnerAddress, TaxDistrict, PropertyAddress, and SaleDate columns from the dataset.

## Usage

To clean the Nashville Housing dataset:

1. Set up a SQL Server Management Studio and connect to the database where the dataset is stored.

2. Copy and execute each query mentioned above one by one in the query editor.

3. Review the cleaned dataset and ensure that the necessary data cleaning tasks have been performed correctly.

## Credits

This project is available on GitHub under the project named [Nashville Housing Data Cleaning Project](https://github.com/Pranay62/Housing_Data_Cleaning.git).

Please refer to the project repository for the SQL queries and additional details.

