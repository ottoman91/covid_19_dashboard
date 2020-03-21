# Description
#This scripts downloads the all COVID data from the Johns Hopkins Dashboard

# Author: Usman
# Version: 2020-03-18

# Libraries
library(tidyverse)

# Parameters
url_recovered <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"
url_deaths <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"
url_confirmed <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"

#Path to write cleaned data to
file_out_recovered <- here::here("eda/covid_recovered.rds")
file_out_deaths <- here::here("eda/covid_deaths.rds")
file_out_confirmed <- here::here("eda/covid_confirmed.rds")

#===============================================================================

# Code

url_recovered %>%
  read_csv() %>%
  write_rds(file_out_recovered)

url_deaths %>%
  read_csv() %>%
  write_rds(file_out_deaths)

url_confirmed %>%
  read_csv() %>%
  write_rds(file_out_confirmed)
