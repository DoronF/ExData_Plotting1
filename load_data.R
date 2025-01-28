#load and prepare data from household_power_consumption.txt
library(dplyr)
library(lubridate)

tidy_file <- "tidy_data.rds"

load_data <- function(cache = TRUE) {
    # use cache if exists
    if (file.exists(tidy_file) & cache) {
        dt <- readRDS(tidy_file)
    }
    # else no cache 
    else {
        # specify source format for date and time 
        setClass("myDate")
        setAs("character", "myDate", function(from)
            as.Date(from, format = "%d/%m/%Y"))
        
        setClass("myTime")
        setAs("character", "myTime", function(from)
            as.Date(from, format = "%H:%M:%S"))
        # read the source data file
        dt <- read.table(
            "household_power_consumption.txt",
            sep = ";", 
            header = TRUE,
            colClasses = c("myDate", "character", rep("numeric", 7)),
            na.strings = "?"
        )
        # tidy column names
        colnames(dt) <- tolower(colnames(dt))
        # define start and end dates
        
        start_date <- as.Date("2007-02-01")
        end_date <- as.Date("2007-02-02")
        # filter data table with date range
        dt <- filter(dt, date >= start_date & date <= end_date)
        # add date_time
        dt$date_time <- with(dt, ymd(dt$date) + hms(dt$time))
        # save data table cache 
        saveRDS(dt, tidy_file)
    }
    
    return(dt)
}