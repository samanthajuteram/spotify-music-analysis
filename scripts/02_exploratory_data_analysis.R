#EXPLORATORY DATA ANALYSIS -----------------------------------------------------
#DISTRIBUTION OF EACH CHARCTERISTIC

#install.packages("ggplot2" , dep = T)
#install.packages("patchwork", dep =T)

library(ggplot2)
library(patchwork)

danceability_histogram <-ggplot(cleaned_spotify_youtube_data, aes(x=Danceability)) +
  geom_histogram(color= "black",fill="lightblue") +
  labs(title="Danceability \nDistribution",
       x="Danceability", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


energy_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Energy)) +
  geom_histogram(color= "black",fill="lightblue") +
  labs(title="Energy \nDistribution",
       x="Energy", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


speechiness_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Speechiness)) +
  geom_histogram(color= "black",fill="lightblue") +
  scale_y_sqrt()+
  labs(title="Speechiness \nDistribution",
       x="Speechiness", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


acousticness_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Acousticness)) +
  geom_histogram(color= "black",fill="lightblue") +
  labs(title="Acousticness \nDistribution",
       x="Acousticness", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


instrumentalness_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Instrumentalness)) +
  geom_histogram(color= "black",fill="lightblue") +
  scale_y_sqrt()+
  labs(title="Instrumentalness \nDistribution",
       x="Instrumentalness", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


valence_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Valence)) +
  geom_histogram(color= "black",fill="lightblue") +
  labs(title="Valence \nDistribution",
       x="Valence", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


tempo_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Tempo)) +
  geom_histogram(color= "black",fill="lightblue") +
  labs(title="Tempo \nDistribution",
       x="Tempo", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


key_barplot <- ggplot(cleaned_spotify_youtube_data, aes(x=Key)) +
  geom_histogram(bins = 12,color = "black" ,fill = "lightblue") + 
  labs(title="Key \nDistribution",
       x="Key", y="Frequency") +
  theme_minimal()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))



loudness_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Loudness)) +
  geom_histogram(color= "black",fill="lightblue") +
  labs(title="Loudness \nDistribution",
       x="Loudness", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


duration_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Duration_ms)) +
  geom_histogram(color= "black",fill="lightblue") +
  scale_y_sqrt()+
  scale_x_sqrt()+
  labs(title="Duration \nDistribution",
       x="Duration", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

liveness_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Liveness)) +
  geom_histogram(color= "black",fill="lightblue") +
  labs(title="Liveness \nDistribution",
       x="Liveness", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


stream_histogram <- ggplot(cleaned_spotify_youtube_data, aes(x=Stream )) +
  geom_histogram(color= "black",fill="lightblue") +
  scale_y_sqrt()+
  labs(title="Streams \nDistribution",
       x="Streams", y="Frequency") +
  theme_classic()+
  theme(plot.title = element_text(size=12))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

danceability_histogram + energy_histogram + speechiness_histogram + acousticness_histogram + instrumentalness_histogram + valence_histogram + 
  tempo_histogram + key_barplot + loudness_histogram + duration_histogram + liveness_histogram + stream_histogram

#RELATIONSHIP BETWEEN STREAMS AND DIFFERENT MUSIC CHARCTERISTICS----

#install.packages("ggpubr", dep = T)
library(ggpubr)

#Danceability
danceability_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Danceability)) +
  geom_boxplot(color="black", fill = "lightblue") +
  facet_wrap(~Stream_cat) +
  labs(title="Danceability Distribution \nby Streaming Success",
       x="Streaming Success", y="Danceability") +
  theme_classic()

danceability_scatter <- ggplot(data = cleaned_spotify_youtube_data, aes(x = Danceability, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Danceability",
       x = "Danceability",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

danceability_boxplot + danceability_scatter

#Energy
energy_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y= Energy)) +
  geom_boxplot(color="black", fill = "lightblue") +
  facet_wrap(~Stream_cat) +
  labs(title="Energy Distribution by \nStreams Success",
       x="Streams Success", y="Energy") +
  theme_classic()

energy_scatter <- ggplot(data = cleaned_spotify_youtube_data, aes(x = Energy, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Energy",
       x = "Energy",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

energy_boxplot + energy_scatter

#Valence
valence_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Valence)) +
  geom_boxplot(color="black", fill = "lightblue") +
  facet_wrap(~Stream_cat) +
  labs(title="Valence Distribution by \nStreams Success",
       x="Streams Success", y="Valence") +
  theme_classic()

valence_scatter <- ggplot(data = cleaned_spotify_youtube_data, aes(x = Valence, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Valence",
       x = "Valence",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

valence_boxplot + valence_scatter  


#Acousticness
acousticness_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Acousticness)) +
  geom_boxplot(color="black", fill = "lightblue") +
  facet_wrap(~Stream_cat) +
  labs(title=" Distribution of Acousticness by \nStreams Success",
       x="Streams Success", y="Acousticness") +
  theme_classic()

acousticness_scatter <- ggplot(data = cleaned_spotify_youtube_data, aes(x = Acousticness, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Acousticness",
       x = "Acousticness",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

acousticness_boxplot + acousticness_scatter

#Instrumentalness

# Custom transformation for fourth root scaling

#install.packages("scales", dep = T)
library(scales)

fourth_root_trans <- function() {
  trans_new(name = 'fourthRoot',
            transform = function(x) x^(1/4),
            inverse = function(x) x^4)
}

instrumentalness_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Instrumentalness)) +
  geom_boxplot(color="black", fill = "lightblue") +
  scale_y_continuous(trans = fourth_root_trans()) +
  facet_wrap(~Stream_cat) +
  labs(title="Instrumentalness Distribution \nby treams Success",
       x="Streams Success", y="Instrumentalness") +
  theme_classic()

instrumentalness_scatter<- ggplot(data = cleaned_spotify_youtube_data, aes(x = Instrumentalness, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Instrumentalness",
       x = "Instrumentalness",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

instrumentalness_boxplot + instrumentalness_scatter


#Speechiness
speechiness_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Speechiness)) +
  geom_boxplot(color="black", fill = "lightblue") +
  facet_wrap(~Stream_cat) +
  labs(title="Speechiness Distribution by \nStreams Success",
       x="Stream Level", y="Speechiness") +
  theme_classic()

speechiness_scatter <- ggplot(data = cleaned_spotify_youtube_data, aes(x = Speechiness, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Speechiness",
       x = "Speechiness",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

speechiness_boxplot + speechiness_scatter

#Tempo
tempo_booxplot<- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Tempo)) +
  geom_boxplot(color="black", fill = "lightblue") +
  facet_wrap(~Stream_cat) +
  labs(title="Tempo Distribution by \nStreams Success",
       x="Streams Success", y="Tempo") +
  theme_classic()

tempo_scatter<- ggplot(data = cleaned_spotify_youtube_data, aes(x = Tempo, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Tempo",
       x = "Tempo",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

tempo_booxplot + tempo_scatter  

#Loudness
loudness_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Loudness)) +
  geom_boxplot(color="black", fill = "lightblue") +
  facet_wrap(~Stream_cat) +
  labs(title="Loudness Distribution by \nStreams Success",
       x="Streams Success", y="Loudness") +
  theme_classic()

loudness_scatter <- ggplot(data = cleaned_spotify_youtube_data, aes(x = Loudness, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Loudness",
       x = "Loudness",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

loudness_boxplot + loudness_scatter 

#Duration
duration_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Duration_ms)) +
  geom_boxplot(color="black", fill = "lightblue") +
  scale_y_log10() + 
  facet_wrap(~Stream_cat) +
  labs(title="Duration Distribution by \nStreams Success",
       x="Streams Success", y="Duration") +
  theme_classic()

duration_scatter <- ggplot(data = cleaned_spotify_youtube_data, aes(x = Duration_ms, y = Stream)) +
  geom_point(alpha = 0.3)+
  scale_x_log10() + 
  labs(title = "Scatterplot of Streams \nvs. Duration",
       x = "Duration",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

duration_boxplot + duration_scatter

#Liveness
liveness_boxplot <- ggplot(cleaned_spotify_youtube_data, aes(x = factor(0), y=Liveness)) +
  geom_boxplot(color="black", fill = "lightblue") +
  facet_wrap(~Stream_cat) +
  labs(title="Liveness Distribution by \nStreams Success",
       x="Streams Success", y="Liveness") +
  theme_classic()

liveness_scatter <- ggplot(data = cleaned_spotify_youtube_data, aes(x = Liveness, y = Stream)) +
  geom_point(alpha = 0.3)+
  labs(title = "Scatterplot of Streams \nvs. Liveness",
       x = "Liveness",
       y = "Streams") +
  theme_classic() +
  stat_cor(method="pearson")

liveness_boxplot + liveness_scatter

#Key
# First, calculate the proportion of each key within each Stream_cat level
key_distribution <- cleaned_spotify_youtube_data %>%
  count(Key, Stream_cat) %>%
  group_by(Stream_cat) %>%
  mutate(prop = n / sum(n))

# Plot
ggplot(key_distribution, aes(x = "", y = prop, fill = factor(Key))) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  facet_wrap(~Stream_cat) +
  labs(fill = "Key", title = "Distribution of Keys for High and Low Streams") +
  theme_void() + # Remove background, gridlines, and text
  theme(legend.title = element_text(size = 10), legend.text = element_text(size = 8)) 
