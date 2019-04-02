library(rtweet)
library(dplyr)

## whatever name you assigned to your created app
appname <- "Call of Data"

## api key (example below is not a real key)
key <- "KQX5LLrBPvR3Cz30bcUvnehOW"

## api secret (example below is not a real key)
secret <- "Vv4D6EQTpVKoODCcwd5csmcVgtqrxR4GIXR5og7xQnNODphzdP"

## create token named "twitter_token"
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

## Read old tweets and append new
old <- readr::read_rds("hashtag.rds")

## Search for hashtags CallOfData2018, CoD18
hashtags_options <- c("CallOfData2018", "CallOfData", "CallOfData18", "T3FCallOfData")

tweets <- search_tweets2(
  hashtags_options, n = 18000, include_rts = FALSE
)

tweets <- tweets %>%
  select_(.dots = colnames(old))

all <- rbind(old, tweets) %>% unique()

readr::write_rds(all, "hashtag.rds")


all %>% distinct(status_id)

# from_us <- get_timeline(
#   "RLadiesMAD", n = 18000
# )

# readr::write_rds(from_us, "rladiesmad_20180128.rds")
