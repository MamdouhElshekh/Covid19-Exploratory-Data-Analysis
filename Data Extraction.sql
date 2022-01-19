-- Extracting Covid Cases and Deaths data into CovidDeaths table 
DROP TABLE IF EXISTS CovidDeaths; 
CREATE TABLE CovidDeaths
AS
SELECT iso_code, continent,
location, date, total_cases, new_cases,
new_cases_smoothed, total_deaths, new_deaths,
new_deaths_smoothed, total_cases_per_million, 
new_cases_per_million, new_cases_smoothed_per_million,
total_deaths_per_million, new_deaths_per_million,
new_deaths_smoothed_per_million
FROM coviddata;

-- Extracting Covid Vaccinations data into CovidVaccinations table 
DROP TABLE IF EXISTS CovidVaccinations;
CREATE TABLE CovidVaccinations
AS
SELECT iso_code, continent,
location, date, new_tests, total_tests_per_thousand,
new_tests_per_thousand, new_tests_smoothed_per_thousand,
positive_rate,tests_per_case,tests_units, total_vaccinations,
people_vaccinated, people_fully_vaccinated, total_boosters,
new_vaccinations,new_vaccinations_smoothed,total_vaccinations_per_hundred,
people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred, 
total_boosters_per_hundred, new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred,
stringency_index,population,population_density,median_age,
aged_65_older, aged_70_older, gdp_per_capita, extreme_poverty,
cardiovasc_death_rate, diabetes_prevalence, female_smokers,
male_smokers, handwashing_facilities, hospital_beds_per_thousand,
life_expectancy, human_development_index,
excess_mortality_cumulative_absolute, 
excess_mortality_cumulative,
excess_mortality,
excess_mortality_cumulative_per_million
FROM coviddata;

DROP TABLE `Covid19`.`coviddata`;