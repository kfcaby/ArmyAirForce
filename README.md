
ArmyAirForce
============

Performs analysis of play-by-play data from the Army - Air Force 2018 football game. Intended to demonstrate regression models in introductory statistics courses.

I obtained the data from www.reddit.com (user: BlueSCar). For additional data, see this post (<https://www.reddit.com/r/CFBAnalysis/comments/6wz5ww/2017_play_by_play_data/>).

Load libraries and data
-----------------------

``` r
library(tidyverse)
```

    ## ── Attaching packages ────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 2.2.1     ✔ purrr   0.2.4
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.4
    ## ✔ tidyr   0.8.1     ✔ stringr 1.2.0
    ## ✔ readr   1.1.1     ✔ forcats 0.3.0

    ## ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
plays <- read_csv(file = "PBP - 2018 - Week 10.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_integer(),
    ##   homeTeam = col_character(),
    ##   homeAbbr = col_character(),
    ##   awayTeam = col_character(),
    ##   awayAbbr = col_character(),
    ##   offenseTeam = col_character(),
    ##   offenseAbbr = col_character(),
    ##   defenseTeam = col_character(),
    ##   defenseAbbr = col_character(),
    ##   isScoringPlay = col_character(),
    ##   clock = col_time(format = ""),
    ##   type = col_character(),
    ##   description = col_character()
    ## )

    ## See spec(...) for full column specifications.

``` r
head(plays)
```

    ## # A tibble: 6 x 29
    ##   gameId  year  week homeId homeTeam homeAbbr awayId awayTeam awayAbbr
    ##    <int> <int> <int>  <int> <chr>    <chr>     <int> <chr>    <chr>   
    ## 1 4.01e8  2018    10   2084 Buffalo  BUFF        193 Miami (… M-OH    
    ## 2 4.01e8  2018    10   2084 Buffalo  BUFF        193 Miami (… M-OH    
    ## 3 4.01e8  2018    10   2084 Buffalo  BUFF        193 Miami (… M-OH    
    ## 4 4.01e8  2018    10   2084 Buffalo  BUFF        193 Miami (… M-OH    
    ## 5 4.01e8  2018    10   2084 Buffalo  BUFF        193 Miami (… M-OH    
    ## 6 4.01e8  2018    10   2084 Buffalo  BUFF        193 Miami (… M-OH    
    ## # ... with 20 more variables: driveIndex <int>, playIndex <int>,
    ## #   offenseId <int>, offenseTeam <chr>, offenseAbbr <chr>,
    ## #   defenseId <int>, defenseTeam <chr>, defenseAbbr <chr>,
    ## #   homeScore <int>, awayScore <int>, isScoringPlay <chr>, quarter <int>,
    ## #   clock <time>, type <chr>, down <int>, distance <int>, yardLine <int>,
    ## #   yardsGained <int>, endYardLine <int>, description <chr>

Data Cleaning
-------------
