% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getpcd.R
\name{getpcd}
\alias{getpcd}
\title{Get Provisional COVID-19 Death Counts by Sex, Age, and State}
\usage{
getpcd(state = "", maxrecs = 200)
}
\arguments{
\item{state}{(default: blank, i.e. all states are returned. Note that this is thge full name of the state, not an abbreviation. For example: New Jersey.)}

\item{maxrecs}{(default: 500, i.e. only the first 500 records are returned. Note: Max=50000)}
}
\value{
data.frame
}
\description{
Get Provisional COVID-19 Death Counts by Sex, Age, and State
}
\examples{
getpcd(maxrecs=100)
getpcd(state="New\%20Jersey")

}
