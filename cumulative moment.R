library(dplyr)
library(ggplot2)
quakes <- read.csv("quakes.csv") 
quakes <-
  select(quakes,time, mag, magType, place) %>%
  mutate(date = as.Date(time)) %>%
  arrange(date) %>%
  mutate(rel.moment = 10^(1.5*(mag-6)),
         cs = cumsum(rel.moment),
         normalized.seismic.moment = cs/max(cs))
 
  #plot
#with(quakes, plot(date, normalized.seismic.moment, type = "s"))
  #diff magnitudes

p1 <- ggplot(quakes, aes(x=date,y=normalized.seismic.moment)) + 
       geom_step()

