#' Get Provisional COVID-19 Death Counts by Sex, Age, and State
#'
#' @param state (default: blank, i.e. all states are returned. Note that this is thge full name of the state, not an abbreviation. For example: New Jersey.)
#' @param maxrecs (default: 500, i.e. only the first 500 records are returned. Note: Max=50000)
#'
#' @return data.frame
#' @export
#'
#' @examples
#' getpcd(maxrecs=100)
#' getpcd(state="New%20Jersey")
#'
getpcd <- function(state = "", maxrecs = 200) {
  base_url = "https://data.cdc.gov/resource/9bhg-hcku.json?$offset=0&$order=state"
  full_url = base_url
  if (state != "" && !is.na(state) && !is.null(state)) {
    full_url = paste(base_url,"&state=",state,"",sep="")
  }
  if (maxrecs != "" && !is.na(maxrecs) && !is.null(maxrecs)) {
    limit = as.integer(maxrecs)
    if (limit > 200 && limit <= 50000) {
      full_url = paste(full_url,"&$limit=",limit,sep="")
    }
    else {
      full_url = paste(full_url,"&$limit=",200,sep="")
    }
  }
  else {
    full_url = paste(full_url,"&$limit=",200,sep="")
  }
  print(paste("URL:",full_url))
  x <- jsonlite::fromJSON(full_url)
  data_as_of <-  as.Date(x$data_as_of[1])
  print(paste("Data as of: ",data_as_of))
  x <- subset (x, select = -data_as_of)
  x$start_date <- as.Date(x$start_date)
  x$end_date <- as.Date(x$end_date)
  x$year <- as.factor(x$year)
  x$month <- as.factor(x$month)
  x$group <- as.factor(x$group)
  x$state <- as.factor(x$state)
  x$sex <- as.factor(x$sex)
  x$age_group <- as.factor(x$age_group)
  x$covid_19_deaths <- as.integer(x$covid_19_deaths)
  x$total_deaths <- as.integer(x$total_deaths)
  x$pneumonia_deaths <- as.integer(x$pneumonia_deaths)
  x$pneumonia_and_covid_19_deaths <- as.integer(x$pneumonia_and_covid_19_deaths)
  x$pneumonia_influenza_or_covid <- as.integer(x$pneumonia_influenza_or_covid)
  x$influenza_deaths <- as.integer(x$influenza_deaths)
  (x)
}
