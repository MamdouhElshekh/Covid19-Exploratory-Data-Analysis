-- Altering data type of total_deaths..CovidDeaths & new_deaths from NVARCHAR To INT 

ALTER TABLE CovidDeaths
ALTER COLUMN total_deaths
BIGINT;

ALTER TABLE CovidDeaths
ALTER COLUMN new_deaths
BIGINT; 

ALTER TABLE CovidDeaths
ALTER COLUMN date
DATE;

ALTER TABLE CovidVaccinations
ALTER COLUMN people_vaccinated
BIGINT;

/* Looking at global numbers */

-- Date & number of first reported cases by country

SELECT location, MIN(date) AS date_of_first_reported_case,
	MIN(total_cases) number_of_first_reported_cases
FROM CovidDeaths
WHERE total_cases IS NOT NULL AND continent IS NOT NULL
GROUP BY location
ORDER BY date_of_first_reported_case;

-- Looking at the current total Covid 19 cases count & deaths

SELECT location,MAX(date) AS 'current_date', MAX(total_cases) AS Total_Cases,
	MAX(total_deaths) AS Total_Deaths
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY Total_Cases DESC;

-- Looking at change in global death percentage overtime

SELECT YEAR(date) AS year, DATEPART(MONTH,date) AS month ,ROUND(SUM(new_deaths)/SUM(New_Cases)*100,2) as DeathPercentage
FROM CovidDeaths
WHERE continent is not null AND new_deaths IS NOT NULL
GROUP BY DATEPART(MONTH,date), YEAR(date)
ORDER BY YEAR(date),DATEPART(MONTH,date);

/*Country Specific Stats*/

DECLARE @location nvarchar(255)
SET @location = 'Egypt'

-- Looking at countries with highest infection rate compared to Population

SELECT location, MAX(DATE) AS 'current_date',
	MAX(population) AS current_population, MAX(total_cases) AS current_total_cases,
	ROUND((MAX(total_cases)/MAX(population))*100,2) AS current_infection_rate
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY current_infection_rate DESC;

-- Looking at countries with highest death count per population

SELECT location, MAX(DATE) AS 'current_date', MAX(total_deaths) AS current_total_deaths
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY current_total_deaths DESC;

-- Looking at rate of infection in your country
-- Showing what percentage of population contarcted Covid-19 in your country

SELECT location, MAX(DATE) AS 'current_date',
	MAX(population) AS current_population, MAX(total_cases) AS current_total_cases,
	ROUND((MAX(total_cases)/MAX(population))*100,2) AS current_infection_rate
FROM CovidDeaths
WHERE continent IS NOT NULL AND location = @location
GROUP BY location;

-- Looking at the fatality rate in your country
-- Showing the likelihood of dying if you contract Covid-19 today in your country

SELECT location, MAX(DATE) AS 'current_date',
	MAX(total_cases) AS current_totalcases, MAX(total_deaths) AS current_total_deaths,
	ROUND((MAX(total_deaths)/MAX(total_cases))*100,2) AS current_death_percent
FROM CovidDeaths
WHERE continent IS NOT NULL AND location = @location
GROUP BY location;

-- Looking at Continent Specific Stats

DECLARE @continent nvarchar(255)
SET @continent = 'Africa'

-- Looking at continents with highest death count per population

WITH countrydeathcount AS (SELECT continent,location,
	MAX(total_deaths) AS new_total
FROM CovidDeaths
WHERE continent IS NOT NULL 
	--AND continent = @continent
GROUP BY location, continent
)
SELECT continent, SUM(new_total) AS deaths_per_continent
FROM countrydeathcount
GROUP BY continent
ORDER BY deaths_per_continent DESC;

-- Looking at Total Population Vs Vaccinations Per Country


