#DATA CLEANING AND WRANGLING----------------------------------------------------
#DATASET----
spotify_youtube_data <- read.csv("C:\\Users\\SamJutes\\Downloads\\Spotify_Youtube.csv")

#SKIMMING----
library(skimr)
skim(spotify_youtube_data)

#REMOVING ROWS WITH MISSING VALUES ----

#install.packages("tidyverse", dep = T)
#install.packages("dplyr", dep = T)

library(tidyverse)
library(dplyr)

# REMOVING UNECESSARY VARIABLES ----

cleaned_spotify_youtube_data <- spotify_youtube_data %>%
  select(-Url_spotify, -Uri, -Url_youtube, -Title, -Channel, -Description, -Licensed, -Views, -Comments)

#REMOVING ROWS WITH MISSING VALUES ----

cleaned_spotify_youtube_data <- cleaned_spotify_youtube_data %>%
  filter(!is.na(Danceability) & !is.na(Energy) & !is.na(Key) & !is.na(Loudness) &
           !is.na(Speechiness) & !is.na(Acousticness) & !is.na(Instrumentalness) &
           !is.na(Liveness) & !is.na(Valence) & !is.na(Tempo) & !is.na(Duration_ms) &
           !is.na(Stream) & !is.na(Likes))


#CHECKING FOR DUPLICATE TRACKS ----

duplicated_tracks <- cleaned_spotify_youtube_data %>%
  group_by(Track, Album) %>%
  filter(n() > 1)

# It appears that some tracks have two artists on them so the track is repeated.
# Remove the duplicate if the track and album are the same 

# REMOVE DUPLICATES IF TRACK AND ALBUM ARE THE SAME ----
cleaned_spotify_youtube_data <- cleaned_spotify_youtube_data %>%
  distinct(Track, Album, .keep_all = TRUE)

#CATEGORIZING STREAMS INTO HIGH AND LOW
cleaned_spotify_youtube_data$Stream_cat <- cut(cleaned_spotify_youtube_data$Stream,
                                               breaks = c(-Inf, 100000000, Inf),
                                               labels = c("Low", "High"),
                                               include.lowest = TRUE)

#CHECKING CLEANED DATASET
skim(cleaned_spotify_youtube_data)
