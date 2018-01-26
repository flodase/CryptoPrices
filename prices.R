## install packages (do this only the first time)
install.packages("rlist")
install.packages("jsonlite")

## load packages
library(rlist)
library(jsonlite)

# define starting point (in seconds since January 1, 1970)
start <- 1483225200 # just a dummy

# define final point
t <- 1483225500 # just a dummy



# create a new list and fetch values
data <- list()
for(i in seq(as.numeric(start), as.numeric(t), by=300)) {
  link <- paste("https://min-api.cryptocompare.com/data/pricehistorical?fsym=LTC&tsyms=BTC,USD,EUR&ts=", i, sep ="")
  x <- fromJSON(link)
  data <- list.append(data, x)
  Sys.sleep(15)
}

list.save(lst, 'ltcprice.JSON')
