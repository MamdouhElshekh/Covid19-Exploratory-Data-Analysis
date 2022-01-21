/* Altering Data Types for appropriate further data analysis */

SET SQL_SAFE_UPDATES = 0;

-- Altering data type of total_deaths..CovidDeaths from TEXT To BIGINT 
UPDATE CovidDeaths
SET total_deaths = NULL
WHERE total_deaths = '';

ALTER TABLE CovidDeaths
MODIFY COLUMN total_deaths BIGINT;

-- Altering data type of new_deaths..CovidDeaths from TEXT To BIGINT 
UPDATE CovidDeaths
SET new_deaths = NULL
WHERE new_deaths = '';

ALTER TABLE CovidDeaths
MODIFY COLUMN new_deaths BIGINT; 

-- Altering data type of date..CovidDeaths from TEXT To DATE
ALTER TABLE CovidDeaths
MODIFY COLUMN date DATE;

-- Altering data type of people_vaccinated..CovidVaccinations from TEXT To BIGINT 
UPDATE CovidVaccinations
SET people_vaccinated = NULL
WHERE people_vaccinated = '';

ALTER TABLE CovidVaccinations
MODIFY COLUMN people_vaccinated BIGINT;

SET SQL_SAFE_UPDATES = 1;


