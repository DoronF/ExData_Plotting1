source("load_data.R")

dt <- load_data()
png(
    filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px"
)


hist(
    dt$global_active_power,
    col = "red",
    xlab = "Global Active Power (kilowatts)",
    main = "Global Active Power"
)

dev.off()