# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = covid_confirmed.rds covid_deaths.rds covid_recovered.rds

# EDA studies
EDA =

# Reports
REPORTS =

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies


# EDA study and report dependencies


# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
