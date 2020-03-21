
## About This Repository

This is the repository for a COVID-19 dashboard that has been deployed as a Shiny App. The code is written in R, and has been developed with the intent of providing the codebase for anybody who wants to make interactive dashboards that allow a user to select the countries and dates to observe the trends in COVID-19 cases. The dashboard uses data compiled by Johns Hopkins University for their [COVID-19 Dashboard](https://coronavirus.jhu.edu/map-faq.html). 


## Folders in this Repository 


The following is a brief description of the main folders in this repository

(P.S. apologies for the subpar documentation for this repo, I will be improving and expanding on it over the next few days).

- scripts : This folder contains the R scripts that download the data and store it as an RDS object. Run these scripts every day to download the updated data. You can run these scripts by navigating to the scripts folder from your terminal, and then running `RScript [name_of_script]`.  

- eda - This folder contains the `time_series_analysis.rmd` file, which contains a few animated visualizations of the trends in cases over time. It also contains the dashboad.rmd file, which has been knitted and deployed on a shiny app. 
Folks interested in running the dashboard on their local machine can knit this file in Rstudio and deploy it locally. 


=======


## Folders in this Repository 


The following is a brief description of the main folders in this repository

(P.S. apologies for the subpar documentation for this repo, I will be improving and expanding on it over the next few days).

- scripts : This folder contains the R scripts that download the data and store it as an RDS object. Run these scripts every day to download the updated data. You can run these scripts by navigating to the scripts folder from your terminal, and then running `RScript [name_of_script]`.  

- eda - This folder contains the `time_series_analysis.rmd` file, which contains a few animated visualizations of the trends in cases over time. It also contains the dashboad.rmd file, which has been knitted and deployed on a shiny app. 
Folks interested in running the dashboard on their local machine can knit this file in Rstudio and deploy it locally. 
