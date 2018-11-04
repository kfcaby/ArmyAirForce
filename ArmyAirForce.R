library(tidyverse)

setwd("./Downloads")
#load college football play by play for Week 10
plays <- read_csv(file = "PBP - 2018 - Week 10.csv")

#get army play by play
plays <- plays %>% filter(homeTeam == "Army")
View(plays)

# filter punts and kickoffs
unique(plays$type)
plays_RushAndPass <- plays %>% filter(type %in% 
                                        c("Rush","Pass Reception","Rushing Touchdown",
                                          "Pass Incompletion")) 
#Let's look at total yards by quarter and team
plays_RushAndPass %>% ggplot(aes(x = factor(quarter), y = yardsGained, color = offenseTeam)) +
  geom_boxplot()

plays_RushAndPass %>% ggplot(aes(x = factor(down), y = yardsGained, color = offenseTeam)) +
  geom_boxplot()


plays_RushAndPass %>% group_by(quarter, offenseTeam) %>% 
  summarise(averageYards = mean(yardsGained),
            totalYards = sum(yardsGained), 
            n = n())

plays_Army <- plays_RushAndPass %>% filter(offenseTeam == "Army") 

#-------Can we predict the number of yards Army gains?------#
#Lets start with a simple model
#Does Army gain more yards when there is father to go for 
# the first down
plays_Army %>% ggplot(aes(x = distance, y = yardsGained)) + 
  geom_point() + geom_smooth(method = "lm")

model_distance <- lm(yardsGained ~ distance, 
                 data = plays_Army)
summary(model_distance)

# Now, let's add down information
plays_Army %>% ggplot(aes(x = factor(down), y = yardsGained)) +
  geom_boxplot()

model_distance_down <- lm(yardsGained ~ distance + factor(down), 
                          data = plays_Army)
summary(model_distance_down)
