
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PCD

<!-- badges: start -->
<!-- badges: end -->

The goal of PCD is to make it easier to work with the Provisional
COVID-19 Death Counts by Sex, Age, and State published by the CDC at
<https://dev.socrata.com/foundry/data.cdc.gov/9bhg-hcku>

The package invokes a REST API to get the latest data from the CDC. For
details on the data elements, please visit the CDC page at:
<https://dev.socrata.com/foundry/data.cdc.gov/9bhg-hcku>

## Installation

You can install the released version of PCD from
[CRAN](https://CRAN.R-project.org) with:

``` r
devtools::install_github("atsats/PCD")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(PCD)
## The code below fetches up to 1,000 records for the State of New Jersey.
cdc_data <- getpcd(maxrecs=1000,state="New%20Jersey")
#> [1] "URL: https://data.cdc.gov/resource/9bhg-hcku.json?$offset=0&$order=state&state=New%20Jersey&$limit=1000"
#> [1] "Data as of:  2021-03-03"
## The latest entire data set can be retrieved with
cdc_data <- getpcd(maxrecs=5000)
#> [1] "URL: https://data.cdc.gov/resource/9bhg-hcku.json?$offset=0&$order=state&$limit=5000"
#> [1] "Data as of:  2021-03-03"
```

Here’s a sample usage of the package.

``` r
# Get the national-level data
cdc_data <- getpcd(maxrecs=1000,state="United%20States")
#> [1] "URL: https://data.cdc.gov/resource/9bhg-hcku.json?$offset=0&$order=state&state=United%20States&$limit=1000"
#> [1] "Data as of:  2021-03-03"
# filter the columns of interest (note that CDC's age_category overlap, so eliminate the overlaps)
d <- cdc_data[cdc_data$state == "United States" & cdc_data$sex == "All Sexes" & cdc_data$age_group %in% c("15-24 years","25-34 years","35-44 years","45-54 years","55-64 years","65-74 years","75-84 years","85 years and over") & is.na(cdc_data$year) ,]
# focus on the important variables
f <- data.frame(age_group=d$age_group,covid_19_deaths= d$covid_19_deaths,total_deaths=d$total_deaths)
(f)
#>           age_group covid_19_deaths total_deaths
#> 1       15-24 years             708        38992
#> 2       25-34 years            3155        80626
#> 3       35-44 years            8302       115762
#> 4       45-54 years           22987       213460
#> 5       55-64 years           58708       494789
#> 6       65-74 years          107213       764513
#> 7       75-84 years          137840       933860
#> 8 85 years and over          155175      1148460
```
