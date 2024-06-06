# Analysis of Music Characteristics on Streaming Success

## Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Installation](#installation)
- [Usage](#usage)
- [Analysis](#analysis)
- [Contributions](#contributions)
- [License](#license)
- [Acknowledgments](#acknowledgments)
  
## Overview
In this project, the influence of musical attributes on the streaming success of songs on Spotify is investigated. Using a dataset of the top 10 songs of various Spotify artists, collected in February 2023, an analysis was conducted on a variety of musical characteristics to understand the role they play in driving streaming numbers. After data cleaning, exploratory data analysis, and statistical data analysis, various models such as logistic regression, ridge regression, Support Vector Machines, and Random Forests were used to model streaming success.

### What the Analysis Does
The analysis processes a dataset of top Spotify songs to examine the relationship between musical features and streaming success. It employs various statistical and machine learning models to predict streaming success and identify key musical attributes that contribute to higher stream counts.

### Technologies Used
- **R**: Chosen for its robust capabilities in data cleaning, exploratory data analysis, and advanced statistical modeling. It provides powerful libraries and tools for machine learning and data visualization, which are essential for this type of analysis.

### Challenges Faced
- **Subjective Definition of a 'Hit'**: Different sources have varying thresholds for what is considered a hit, leading to inconsistencies when analyzing streaming success across diverse music platforms.
- **Genre Considerations**: The genre of the songs was not considered in modeling, which could affect the interpretation of streaming success due to differing popularity levels across genres.
- **Release Date**: The models did not account for the length of time a song had been released, potentially favoring older songs and misrepresenting the streaming success of newer tracks.

### Future Features
- **Include Genre as a Variable**: Incorporating genre into the analysis to understand streaming success in different musical contexts.
- **Anomaly Detection Techniques**: Using these techniques to identify songs that perform exceptionally well or poorly, and analyze the factors contributing to their performance.
- **Standardize Measurement Period**: Ensuring that the streaming success is measured over a consistent time frame to avoid misrepresentation between older and newer songs.

## Dataset 
The dataset used for this analysis is sourced from Kaggle. It consists of the top 10 songs of various Spotify artists, collected in February 2023. It includes information on various musical characteristics such as tempo, key, loudness, and duration.

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/samanthajuteram/spotify-music-analysis.git
    ```
2. Navigate to the project directory:
    ```bash
    cd spotify-music-analysis
    ```

## Usage

### Data Cleaning
To read in and clean the dataset, run the following command:
```bash
Rscript scripts/01_data_cleaning.R
```

### Exploratory Data Analysis
To perform exploratory data analysis, run the following command:
```bash
Rscript scripts/02_exploratory_data_analysis.R
```

### Statistical Analysis
To conduct statistical analysis, run the following command:
```bash
Rscript scripts/03_statistical_analysis.R
```

### Modeling and Evaluation
To build and evaluate models, run the following command:
To conduct statistical analysis, run the following command:
```bash
Rscript scripts/04_modeling_and_prediction.R
```

## Analysis

The analysis focuses on the following aspects of music characteristics:

- Identifying key predictors of streaming success using various models such as logistic regression, ridge regression, Support Vector Machines, and Random Forests.
- Evaluating model performance and accuracy.
- Providing insights into how Loudness, Energy, and Instrumentalness influence streaming numbers.

Results are presented in the form of visualizations and summary statistics, which can be found in the PDF report under the report directory.

## Contributions
This project is a work in progress. Feedback and contributions are welcome! Feel free to reach out via [LinkedIn](https://www.linkedin.com/in/samantha-juteram-85b010225) or [Email](mailto:smjuteram@hotmail.com).

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE.txt) file for details.

## Acknowledgments
- [Kaggle Dataset](https://www.kaggle.com/datasets/salvatorerastelli/spotify-and-youtube): Statistics for the Top 10 songs of various spotify artists and their youtube video.
- Libraries used:
  - skimr
  - tidyverse
  - dplyr
  - ggplot2
  - patchwork
  - ggubr
  - scales
  - car
  - ROSE
  - caTools
  - caret
  - glmnet
  - e1071
  - randomForest
  - pROC
