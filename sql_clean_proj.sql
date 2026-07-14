-- Data Cleaning

-- 1. Remove Duplicates
-- 2. Standardise the data
-- 3. Null values or blank values
-- 4. Remove any columns
use _world_layoffs;

select 
	* 
from 
    layoffs;

create table
	layoffs_staging 
like 
	layoffs;


select
	*
from 
	layoffs_staging;


insert into layoffs_staging


select
	* 
from 
	layoffs;

-- starting with removing duplicates:

with cte as
(select 
	*,
	row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`,stage, country, funds_raised_millions) as row_num
from 
	layoffs_staging
)
select 
	*
from
	cte
where 
	row_num>1;
    

CREATE TABLE `layoffs2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `row_num` int
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select 
	* 
from
	layoffs2;


insert into layoffs2 


select 
	*,
	row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`,stage, country, funds_raised_millions) as row_num
from 
	layoffs_staging;


delete 
from 
	layoffs2
where
	row_num>1;


-- standardizing data ( fixing values )

select 
	company, 
    trim(company) -- trimming white spaces in company names.
from 
	layoffs2;


update 
	layoffs2
set 
	company=trim(company);

-- checking as to any problem in industry column.
select
	distinct industry
from
	layoffs2;


update 
	layoffs2
set 
	industry="Crypto"
where 
	industry like "Crypto%";
    
-- checking as to if any problem in location column.
select 
	distinct location
from
	layoffs2;

-- checking problem in country column.
select
	distinct country
from
	layoffs2
order by
	1;


update layoffs2
set country="United States"
where country like "United States%";

-- converted date from text to date data type.
select
	`date`,
str_to_date(`date`, "%m/%d/%Y")
from
	layoffs2;


update 
	layoffs2
set
	`date`=str_to_date(`date`, "%m/%d/%Y");

alter table 
	layoffs2
modify
	`date` date;


-- filling unnecessary null blanks in industry column. 
update layoffs2 
set industry=null
where industry=''; 


update 
	layoffs2 t1 inner join layoffs2 t2 on t1.company=t2.company and t1.location=t2.location
set
	t1.industry=t2.industry
where
	t1.industry is null and t2.industry is not null;
	
-- deleting rows with total_layoff and percentage_layoff is null cause they are not relevant.

delete 
from 
	layoffs2
where
	total_laid_off is null and percentage_laid_off is null;

-- dropping row_num cause not required anymore:

alter table
	layoffs2
drop
	row_num;

-- DONE BY: Abhijit Ramesh on actual layoff data.
    


    



  



    

