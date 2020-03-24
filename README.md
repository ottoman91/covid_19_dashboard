
## About This Repository

This is the repository for a COVID-19 dashboard that has been deployed as a Shiny App. The code is written in R, and has been developed with the intent of providing the codebase for anybody who wants to make interactive dashboards that allow a user to select the countries and dates to observe the trends in COVID-19 cases. The dashboard uses data compiled by Johns Hopkins University for their [COVID-19 Dashboard](https://coronavirus.jhu.edu/map-faq.html). 



## Folders in this Repository 


The following is a brief description of the main folders in this repository

(P.S. apologies for the subpar documentation for this repo, I will be improving and expanding on it over the next few days).

# NOTE - 

I have updated the code base so that it doesnt use the scripts folder anymore. To download the data, in the `dashboard.rmd` file, uncomment the following command: `devtools::install_github("ottoman91/covid19")` . This will install the `covid19` package from my github repo(I have submitted this package to CRAN and will update the code base once it gets approved). The `covid19` package provides a cleaner tidy tibble of the JHU data. 

- scripts : This folder contains the R scripts that download the data and store it as an RDS object. I am no longer using these files, and am instead using the `covid19` package that I wrote for downloading the data(refer to instructions above).

- eda - This folder contains the `time_series_analysis.rmd` file, which contains a few animated visualizations of the trends in cases over time. It also contains the dashboad.rmd file, which has been knitted and deployed on a shiny app. 
Folks interested in running the dashboard on their local machine can knit this file in Rstudio and deploy it locally. 

## Acknowledgements 

This code base builds up on the amazing work that is being done by the following:

- [Johns Hopkins University](https://coronavirus.jhu.edu/map-faq.html)

- [Our World in Data](https://ourworldindata.org/coronavirus#current-covid-19-test-coverage-estimates)


