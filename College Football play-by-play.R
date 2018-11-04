library(tidyverse)
getwd()
setwd("./Downloads/")

houses <- read_csv(file = "redfin_2018-10-22-06-48-50.csv")
View(houses)

houses <- houses %>% filter(PRICE < 1000000)

# Plot of price vs size
houses %>% ggplot(aes(x = `SQUARE FEET`, y = PRICE)) +
  geom_point() + geom_smooth(method = "lm")

#fit a linear model
model1 <- lm(PRICE ~ `SQUARE FEET`, data = houses)
summary(model1)

#now let's look at age
houses <- houses %>% mutate(age = 2018 - `YEAR BUILT`)
houses %>% filter(age > 25) %>% ggplot(aes(x = age, y = PRICE)) +
  geom_point() + geom_smooth(method = "lm")


# Plot of price vs location