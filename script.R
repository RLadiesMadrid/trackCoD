library(rtweet)
library(dplyr)

## Read old tweets and append new
old <- readr::read_rds("hashtag.rds")

## Search for hashtags CallOfData2018, CoD18
hashtags_options <- c("CallOfData2018", "CallOfData", "CallOfData18")

tweets <- search_tweets2(
  hashtags_options, n = 18000, include_rts = FALSE
)

all <- rbind(old, tweets) %>% unique()

readr::write_rds(all, "hashtag.rds")


# from_us <- get_timeline(
#   "RLadiesMAD", n = 18000
# )
# 
# readr::write_rds(from_us, "rladiesmad_20180128.rds")
