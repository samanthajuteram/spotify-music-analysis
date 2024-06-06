#STATISTICAL ANALYSIS ----------------------------------------------------------
#LOGISTIC REGRESSION----

#Danceability
model_danceability <- glm(Stream_cat ~ Danceability, data = cleaned_spotify_youtube_data,
                          family = binomial)

summary(model_danceability)


#Speechiness
model_speechiness <- glm(Stream_cat ~ Speechiness, data = cleaned_spotify_youtube_data,
                         family = binomial)

summary(model_speechiness)


#Energy
model_energy <- glm(Stream_cat ~ Energy, data = cleaned_spotify_youtube_data,
                    family = binomial)
summary(model_energy)


#Instrumentalness
model_instrumentalness <- glm(Stream_cat ~ Instrumentalness, data = cleaned_spotify_youtube_data,
                              family = binomial)
summary(model_instrumentalness)


#Valence
model_valence <- glm(Stream_cat ~ Valence, data = cleaned_spotify_youtube_data,
                     family = binomial)
summary(model_valence)


#Tempo
model_tempo <- glm(Stream_cat ~ Tempo, data = cleaned_spotify_youtube_data,
                   family = binomial)
summary(model_tempo)


#Key
model_key <- glm(Stream_cat ~ Key, data = cleaned_spotify_youtube_data,
                 family = binomial)
summary(model_key)


#Loudness
model_loudness <- glm(Stream_cat ~ Loudness, data = cleaned_spotify_youtube_data,
                      family = binomial)
summary(model_loudness)



#Duration
model_duration <- glm(Stream_cat ~ Duration_ms, data = cleaned_spotify_youtube_data,
                      family = binomial)
summary(model_duration)


#Liveness
model_liveness <- glm(Stream_cat ~ Liveness, data = cleaned_spotify_youtube_data,
                      family = binomial)
summary(model_liveness)

#LOGISTIC REGRESSION WITH MULTIPLE TERMS----

model_streams_test_1 <- glm(Stream_cat ~ Instrumentalness + Loudness , data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_1)

model_streams_test_2 <- glm(Stream_cat ~ Instrumentalness * Loudness, data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_2)

model_streams_test_3 <- glm(Stream_cat ~ Instrumentalness + Energy, data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_3)

model_streams_test_4 <- glm(Stream_cat ~ Instrumentalness * Energy, data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_4)

model_streams_test_5 <- glm(Stream_cat ~ Loudness + Energy, data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_5)

model_streams_test_6 <- glm(Stream_cat ~ Loudness * Energy, data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_6)

model_streams_test_7 <- glm(Stream_cat ~ Loudness + Energy + Instrumentalness, data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_7)

model_streams_test_8 <- glm(Stream_cat ~ Loudness * Energy * Instrumentalness, data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_8)

model_streams_test_9 <- glm(Stream_cat ~ Loudness + Energy * Instrumentalness, data = cleaned_spotify_youtube_data,
                            family = binomial)
summary(model_streams_test_9)

model_streams_test_10 <- glm(Stream_cat ~ Loudness * Energy + Instrumentalness, data = cleaned_spotify_youtube_data,
                             family = binomial)
summary(model_streams_test_10)

model_streams_test_11 <- glm(Stream_cat ~ Loudness * Instrumentalness + Energy, data = cleaned_spotify_youtube_data,
                             family = binomial)
summary(model_streams_test_11)

#install.packages("car", dep = T)
library(car)

vif_result_model_9 <- vif(model_streams_test_9, type = 'predictor')
print(vif_result_model_9)
