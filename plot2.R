source("load_data.R")

dt <- load_data()
png(
    filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px"
)
plot(
    dt$date_time,
    dt$global_active_power,
    type = "l",
    ylab = "Global Active Power (kilowatts)",
    xlab = "",
    xaxt = "n"
)
axis(1,
     at = c(min(dt$date_time), median(dt$date_time), max(dt$date_time)),
     labels = c("Thu", "Fri", "Sat"))

dev.off()