
library(ggmap)
library(ggplot2)
library(dplyr)

fastfood_map = read.csv("fastfoodtest.csv")
obese_map = read.csv("scrub_obese_test.csv")
obese_map$LocationDesc = tolower(obese_map$LocationDesc)
fastfood_map$state = tolower(fastfood_map$state)

test_map = full_join(fastfood_map, obese_map, 
                     by = c("state"= "LocationDesc"))

usa_center = as.numeric(geocode("United States"))
USAMap = ggmap(get_googlemap(center=usa_center, 
                             scale=2, 
                             zoom=4))

USAMap +
  geom_point(aes(x=lon, y=lat, colour=BMI), 
           data=test_map) +
  scale_fill_gradient(low = "white",
                      high = "darkblue") +
  ggtitle("NEEDS TITLE") 

USAMap +
  geom_point(aes(x=lon, y=lat, fill=BMI), 
             data=obese_map) +
  scale_fill_gradient(low = "white",
                      high = "darkblue") 
               