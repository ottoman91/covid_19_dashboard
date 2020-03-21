Time Series Analysis of Case Load, Recovery and Mortality Rates
================
Usman Khaliq
2020-03-20

  - [Time series analysis on Confirmed COVID cases over time in
    China](#time-series-analysis-on-confirmed-covid-cases-over-time-in-china)
  - [Time series analysis on COVID Deaths cases over time in
    China](#time-series-analysis-on-covid-deaths-cases-over-time-in-china)
  - [Time series analysis on COVID Recoveries over time in
    China](#time-series-analysis-on-covid-recoveries-over-time-in-china)
  - [Time series analysis on Confirmed COVID cases over time in
    Pakistan](#time-series-analysis-on-confirmed-covid-cases-over-time-in-pakistan)
  - [Time series analysis on COVID Deaths cases over time in
    Pakistan](#time-series-analysis-on-covid-deaths-cases-over-time-in-pakistan)
  - [Time series analysis on COVID Recoveries over time in
    Pakistan](#time-series-analysis-on-covid-recoveries-over-time-in-pakistan)
  - [Top Ten Countries with Highest Confirmed
    Cases](#top-ten-countries-with-highest-confirmed-cases)

``` r
# Libraries
library(tidyverse)
library(gganimate)
library(lubridate)

# Parameters

#Paths for the raw data files
covid_confirmed_data <- here::here("data/covid_confirmed.rds")
covid_deaths_data <- here::here("data/covid_deaths.rds")
covid_recovered_data <- here::here("data/covid_recovered.rds")
#==========================================================================

# Code
```

## Time series analysis on Confirmed COVID cases over time in China

First, lets read all the data into Rds objects

``` r
covid_confirmed <-
  covid_confirmed_data %>% 
  read_rds() %>% 
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`,
    lat = Lat,
    long = Long
  )

covid_deaths <-
  covid_deaths_data %>% 
  read_rds() %>% 
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`,
    lat = Lat,
    long = Long
  )

covid_recovered <-
  covid_recovered_data %>% 
  read_rds() %>% 
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`,
    lat = Lat,
    long = Long
  )
```

Now, lets wrangle the data for the confirmed cases so that we can see
the change in the values of confirmed cases over time. (note -
currently, look at country figures)

``` r
covid_confirmed_summarised <-
  covid_confirmed %>% 
  pivot_longer(
    cols = -c(province_state, country_region, lat, long),
    names_to = "date",
    values_to = "confirmed_cases"
  ) %>% 
  group_by(country_region, date) %>% 
  summarise(confirmed_cases = sum(confirmed_cases)) %>% 
  mutate(date = mdy(date)) 

covid_death_summarised <-
  covid_deaths %>% 
  pivot_longer(
    cols = -c(province_state, country_region, lat, long),
    names_to = "date",
    values_to = "confirmed_deaths"
  ) %>% 
  group_by(country_region, date) %>% 
  summarise(confirmed_deaths = sum(confirmed_deaths)) %>% 
  mutate(date = mdy(date))

covid_recovered_summarised <-
  covid_recovered %>% 
  pivot_longer(
    cols = -c(province_state, country_region, lat, long),
    names_to = "date",
    values_to = "confirmed_recovered"
  ) %>% 
  group_by(country_region, date) %>% 
  summarise(confirmed_recovered = sum(confirmed_recovered)) %>% 
  mutate(date = mdy(date))
```

``` r
covid_confirmed_summarised %>% 
  filter(country_region == "China") %>% 
  ggplot(aes(date, confirmed_cases)) +
  geom_line() +
  transition_reveal(date) +
  scale_x_date(
    date_labels = "%d %b %Y",
    date_breaks = "1 week"
  ) +
  labs(
    title = "Trajectory of Confirmed COVID-19 Cases in China",
    x = "Date",
    y = "Number of Cases",
    caption = "Source: Johns Hopkins University"
  )
```

![](time_series_analysis_files/figure-gfm/unnamed-chunk-4-1.gif)<!-- -->

## Time series analysis on COVID Deaths cases over time in China

``` r
covid_death_summarised %>% 
  filter(country_region == "China") %>% 
  ggplot(aes(date, confirmed_deaths)) +
  geom_line() +
  transition_reveal(date) +
  scale_x_date(
    date_labels = "%d %b %Y",
    date_breaks = "1 week"
  ) +
  labs(
    title = "Trajectory of Confirmed COVID-19 Deaths in China",
    x = "Date",
    y = "Number of Deaths",
    caption = "Source: Johns Hopkins University"
  )
```

![](time_series_analysis_files/figure-gfm/unnamed-chunk-5-1.gif)<!-- -->

## Time series analysis on COVID Recoveries over time in China

``` r
covid_recovered_summarised %>% 
  filter(country_region == "China") %>% 
  ggplot(aes(date, confirmed_recovered)) +
  geom_point() +
  geom_line() +
  #transition_reveal(date) +
  scale_x_date(
    date_labels = "%d %b %Y",
    date_breaks = "1 week"
  ) +
  labs(
    title = "Trajectory of Confirmed COVID-19 Recoveries in China",
    x = "Date",
    y = "Number of Recoveries",
    caption = "Source: Johns Hopkins University"
  )
```

![](time_series_analysis_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

## Time series analysis on Confirmed COVID cases over time in Pakistan

``` r
covid_confirmed_summarised %>% 
  filter(country_region == "Pakistan") %>% 
  ggplot(aes(date, confirmed_cases)) +
  geom_line() +
  transition_reveal(date) +
  scale_x_date(
    date_labels = "%d %b %Y",
    date_breaks = "1 week"
  ) +
  labs(
    title = "Trajectory of Confirmed COVID-19 Cases in Pakistan",
    x = "Date",
    y = "Number of Cases",
    caption = "Source: Johns Hopkins University"
  )
```

![](time_series_analysis_files/figure-gfm/unnamed-chunk-7-1.gif)<!-- -->

## Time series analysis on COVID Deaths cases over time in Pakistan

``` r
covid_death_summarised %>% 
  filter(country_region == "Pakistan") %>% 
  ggplot(aes(date, confirmed_deaths)) +
  geom_line() +
  transition_reveal(date) +
  scale_x_date(
    date_labels = "%d %b %Y",
    date_breaks = "1 week"
  ) +
  labs(
    title = "Trajectory of Confirmed COVID-19 Deaths in Pakistan",
    x = "Date",
    y = "Number of Deaths",
    caption = "Source: Johns Hopkins University"
  )
```

![](time_series_analysis_files/figure-gfm/unnamed-chunk-8-1.gif)<!-- -->

## Time series analysis on COVID Recoveries over time in Pakistan

``` r
covid_recovered_summarised %>% 
  filter(country_region == "Pakistan") %>% 
  ggplot(aes(date, confirmed_recovered)) +
  geom_line() +
  transition_reveal(date) +
  scale_x_date(
    date_labels = "%d %b %Y",
    date_breaks = "1 week"
  ) +
  labs(
    title = "Trajectory of Confirmed COVID-19 Recoveries in Pakistan",
    x = "Date",
    y = "Number of Recoveries",
    caption = "Source: Johns Hopkins University"
  )
```

![](time_series_analysis_files/figure-gfm/unnamed-chunk-9-1.gif)<!-- -->

## Top Ten Countries with Highest Confirmed Cases

``` r
covid_confirmed_summarised %>% 
  filter(date == max(covid_confirmed_summarised$date)) %>% 
  group_by(country_region) %>% 
  summarise(total_confirmed_cases = sum(confirmed_cases)) %>% 
  arrange(desc(total_confirmed_cases)) %>% 
  ungroup() %>% 
  mutate(country_region = fct_reorder(country_region, total_confirmed_cases)) %>% 
  top_n(10) %>% 
  ggplot(aes(country_region, total_confirmed_cases)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(breaks = scales::breaks_width(width = 10000)) +
  labs(
    x = "Countries",
    y = "Total Number of Confirmed Cases",
    caption = "Source: Johns Hopkins University"
  )
```

    ## Selecting by total_confirmed_cases

![](time_series_analysis_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->
