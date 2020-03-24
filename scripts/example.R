create("covid19")

library(usethis)

usethis::create_package("covid19")

library(lubridate)

library(tidyverse)
## code below this line is for downloading the data

# Parameters
url_recovered <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"
url_deaths <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"
url_confirmed <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"

#Path to write cleaned data to
file_out_recovered <- here::here("data/covid_recovered.rda")
file_out_deaths <- here::here("data/covid_deaths.Rda")
file_out_confirmed <- here::here("data/covid_confirmed.Rda")

url_confirmed %>%
  read_csv() %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`,
    lat = Lat,
    long = Long
  ) %>%
  pivot_longer(
    cols = -c(province_state, country_region, lat, long),
    names_to = "date",
    values_to = "confirmed_cases"
  ) %>%
  mutate(date = mdy(date)) %>%
  save(file = file_out_recovered)

url_recovered %>%
  read_csv() %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`,
    lat = Lat,
    long = Long
  ) %>%
  pivot_longer(
    cols = -c(province_state, country_region, lat, long),
    names_to = "date",
    values_to = "confirmed_recovered"
  ) %>%
  mutate(date = mdy(date)) %>%
  write_rds(file_out_recovered)

url_deaths %>%
  read_csv() %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`,
    lat = Lat,
    long = Long
  ) %>%
  pivot_longer(
    cols = -c(province_state, country_region, lat, long),
    names_to = "date",
    values_to = "confirmed_deaths"
  ) %>%
  mutate(date = mdy(date)) %>%
  write_rds(file_out_deaths)
