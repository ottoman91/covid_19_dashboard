# Description
#This scripts downloads the daily confirmed COVID cases from the Johns Hopkins Dashboard

# Author: Usman
# Version: 2020-03-18

# Libraries
library(tidyverse)

# Parameters
url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"

#Path to write cleaned data to
file_out <- here::here("data/covid-confirmed.rds")
#===============================================================================

# Code

url %>%
  read_csv() %>%
  write_rds(file_out)
