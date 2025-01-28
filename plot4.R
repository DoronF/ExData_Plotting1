source("load_data.R")

dt <- load_data()

add_days_axis <- function() {
    axis(1,
         at = c(
             min(dt$date_time),
             median(dt$date_time),
             max(dt$date_time)
         ),
         labels = c("Thu", "Fri", "Sat"))
}

png(
    filename = "plot4.png",
    width = 480,
    height = 480,
    units = "px"
)
par(mfcol = c(2, 2))

# top left plot
plot(
    dt$date_time,
    dt$global_active_power,
    type = "l",
    ylab = "Global Active Power (kilowatts)",
    xlab = "",
    xaxt = "n"
)
add_days_axis()

# bottom left plot
plot(
    dt$date_time,
    dt$sub_metering_1,
    type = "n",
    ylab = "Energy sub metering",
    xlab = "",
    xaxt = "n"
)

add_days_axis()

lines(dt$date_time, dt$sub_metering_1)
lines(dt$date_time, dt$sub_metering_2, col = "red")
lines(dt$date_time, dt$sub_metering_3, col = "blue")

legend(
    x = "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col  = c("black", "red", "blue"),
    lty = 1,
    bty = "n",
    cex = .95
)

# top right plot
plot(
    dt$date_time,
    dt$voltage,
    type = "l",
    ylab = "Voltage",
    xlab = "datetime",
    xaxt = "n"
)

add_days_axis()

# bottom right plot
plot(
    dt$date_time,
    dt$global_reactive_power,
    type = "l",
    ylab = "global_reactive_power",
    xlab = "datetime",
    xaxt = "n"
)

add_days_axis()

dev.off()