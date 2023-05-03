select *
from NashvilleHousing

------------------------------------
--1. Standardize Date Format

Select SaleDate ,Convert(date,saledate)
from NashvilleHousing

-------

Update NashvilleHousing
set SaleDate = Convert(date,saledate)

alter table NashvilleHousing
add SaleDateConverted Date

Update NashvilleHousing
set SaleDateConverted = Convert(date,saledate)
---------------------------------------------
-- 2. Populate Property address data for null from parcelID

select n1.ParcelId,n1.PropertyAddress,n2.ParcelId,n2.PropertyAddress,isnull(n1.PropertyAddress,n2.PropertyAddress)
from NashvilleHousing n1
join NashvilleHousing n2
on n1.ParcelId = n2.ParcelId
and n1.uniqueID <> n2.uniqueID
where n1.PropertyAddress is null


update n1
set PropertyAddress  = isnull(n1.PropertyAddress,n2.PropertyAddress)
from NashvilleHousing n1
join NashvilleHousing n2
on n1.ParcelId = n2.ParcelId
and n1.uniqueID <> n2.uniqueID
where n1.PropertyAddress is null

------------------------------------------------------------------------

--Breaking out address into Individual columns (Address, City, State)

select 
PropertyAddress,
Substring(PropertyAddress,1,Charindex(',',PropertyAddress)) as Address,
Substring(PropertyAddress,Charindex(',',PropertyAddress)+1,len(PropertyAddress)) as Area
from NashvilleHousing


alter table NashvilleHousing
add PropertySplitAddress varchar(255);

Update NashvilleHousing
set PropertySplitAddress = Substring(PropertyAddress,1,Charindex(',',PropertyAddress));


alter table NashvilleHousing
add PropertySplitCity varchar(255)

Update NashvilleHousing
set PropertySplitCity = Substring(PropertyAddress,Charindex(',',PropertyAddress)+1,len(PropertyAddress))


select * from
NashvilleHousing


------------------------------------------------------------------------------------


---- Owner Address split

select 
owneraddress,
Parsename(Replace(owneraddress, ',','.'),3),
Parsename(Replace(owneraddress, ',','.'),2),
Parsename(Replace(owneraddress, ',','.'),1)
from NashvilleHousing


alter table NashvilleHousing
add OwnerSplitAddress varchar(255);

Update NashvilleHousing
set OwnerSplitAddress = Parsename(Replace(owneraddress, ',','.'),3);


alter table NashvilleHousing
add OwnerSplitCity varchar(255)

Update NashvilleHousing
set OwnerSplitCity = Parsename(Replace(owneraddress, ',','.'),2)

alter table NashvilleHousing
add Ownersplitstate varchar(255)

Update NashvilleHousing
set Ownersplitstate = Parsename(Replace(owneraddress, ',','.'),1)

select * from
NashvilleHousing


---------------------------------------------------
select distinct(soldasvacant)  from
NashvilleHousing

select soldasvacant,
case when soldasvacant = 'Y' then 'Yes'
when soldasvacant = 'N' then 'No' 
else soldasvacant 
end 
as new_soldasvacant
from NashvilleHousing

update NashvilleHousing
set soldasvacant = case when soldasvacant = 'Y' then 'Yes'
when soldasvacant = 'N' then 'No' 
else soldasvacant 
end 

select distinct(soldasvacant)  from
NashvilleHousing


------------------------------

-- Remove duplicate

with cte as (
select UniqueID ,
	ROW_NUMBER() OVER( 
			Partition by  ParcelId,PropertyAddress,SalePrice,SaleDate,LegalReference
				order by uniqueid) row_num		
from NashvilleHousing
--order by row_num desc
)
delete from cte 
where row_num > 1

select count(*) from NashvilleHousing


-----------------------------------

-- Delete unused columns

select *
from NashvilleHousing

alter table NashvilleHousing
drop column OwnerAddress, TaxDistrict, PropertyAddress

alter table NashvilleHousing
drop column SaleDate

---------


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

--- Importing Data using OPENROWSET and BULK INSERT	

--  More advanced and looks cooler, but have to configure server appropriately to do correctly
--  Wanted to provide this in case you wanted to try it


--sp_configure 'show advanced options', 1;
--RECONFIGURE;
--GO
--sp_configure 'Ad Hoc Distributed Queries', 1;
--RECONFIGURE;
--GO


--USE PortfolioProject 

--GO 

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1 

--GO 

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 

--GO 


---- Using BULK INSERT

--USE PortfolioProject;
--GO
--BULK INSERT nashvilleHousing FROM 'C:\Temp\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv'
--   WITH (
--      FIELDTERMINATOR = ',',
--      ROWTERMINATOR = '\n'
--);
--GO


---- Using OPENROWSET
--USE PortfolioProject;
--GO
--SELECT * INTO nashvilleHousing
--FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
--    'Excel 12.0; Database=C:\Users\alexf\OneDrive\Documents\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv', [Sheet1$]);
--GO