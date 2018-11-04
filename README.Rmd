# ArmyAirForce
Performs analysis of play-by-play data from the Army - Air Force 2018 football game.  Intended to demonstrate regression models in introductory statistics courses.

I obtained the data from www.reddit.com (user: BlueSCar).  For additional data, see this post (https://www.reddit.com/r/CFBAnalysis/comments/6wz5ww/2017_play_by_play_data/). 

##Load libraries and data

```{r}
library(tidyverse)
plays <- read_csv(file = "PBP - 2018 - Week 10.csv")
head(plays)
```


## Data Cleaning



