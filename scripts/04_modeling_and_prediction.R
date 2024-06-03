#MODELING AND EVALUATION--------------------------------------------------------

#BALANCING DATASET

#install.packages("ROSE", dep = T)
library(ROSE)
balanced_data <- ovun.sample(Stream_cat ~ ., 
                             data = cleaned_spotify_youtube_data, 
                             method = "both",
                             seed = 123)

# Extract the balanced dataset
balanced_data <- balanced_data$data


#SPLITTING DATASET INTO TRAIN AND TEST

#install.packages("caTools", dep = T)
library(caTools)


split <- sample.split(balanced_data$Stream_cat, SplitRatio = 0.75)
training_set <- subset(balanced_data, split == TRUE)
test_set <- subset(balanced_data, split == FALSE)

#RIDGE REGRESSION----

x <- model.matrix(Stream_cat ~ Loudness + Danceability * Instrumentalness , training_set)[,-1]
# Convert the outcome (class) to a numerical variable
y <- as.factor(training_set$Stream_cat)

# Find the best lambda using cross-validation
cv.ridge <- cv.glmnet(x, y, alpha = 0, family = "binomial")
# Fit the final model on the training data
model <- glmnet(x, y, alpha = 0, family = "binomial",
                lambda = cv.ridge$lambda.min)
# Display regression coefficients
coef(model)
# Make predictions on the test data
x.test <- model.matrix(Stream_cat ~ Loudness + Energy * Instrumentalness , test_set)[,-1]
probabilities <- model %>% predict(newx = x.test)
predicted.classes <- ifelse(probabilities > 0.5, "High", "Low")
# Model accuracy
observed.classes <- test_set$Stream_cat
mean(predicted.classes == observed.classes)

predicted.classes <- as.factor(predicted.classes)
observed.classes <- as.factor(observed.classes)

levels(predicted.classes) <- levels(observed.classes) <- c("Low", "High")

library(caret)

confusionMatrix(predicted.classes, observed.classes)

#SVM----

library(e1071)
library(caTools)
split <- sample.split(cleaned_spotify_youtube_data$Stream_cat, SplitRatio = 0.75)
training_set <- subset(cleaned_spotify_youtube_data, split == TRUE)
test_set <- subset(cleaned_spotify_youtube_data, split == FALSE)

model_svm = svm(formula = Stream_cat ~ Loudness + Energy * Instrumentalness ,
                data = training_set,
                type = 'C-classification', 
                kernel = 'radial',
                cost = 100,
                gamma = 1)

predictions <- predict(classifierR, newdata=test_set)
table(predictions, actual = test_set$Stream_cat)


predictions <- predict(classifierR, newdata=test_set)

# Calculate accuracy
accuracy <- mean(predictions == test_set$Stream_cat)

# Print the accuracy
print(paste("Accuracy:", round(accuracy, 4)))

#RANDOM FOREST----

library(randomForest)


model_rf <- randomForest(Stream_cat ~ Loudness + Energy * Instrumentalness,
                         data = training_set,
                         mtry = 3,
                         ntree = 100,
                         min.samples.split = 1,
                         min.samples.leaf = 5,
                         max.depth = 5,
                         oob.error=TRUE)

# Make predictions
predictions_rf <- predict(model_rf, newdata = test_set)
table(predictions_rf, actual = test_set$Stream_cat)


# Accuracy
accuracy_rf <- mean(predictions_rf == test_set$Stream_cat)
print(paste("Random Forest Accuracy :", round(accuracy_rf, 4)))

#FURTHER EVALUATION OF RANDOM FOREST MODEL

#install.packages("pROC",dep = T)


library(pROC)

# Calculate the F1 score
precision <- sum(predictions_rf == "High" & test_set$Stream_cat == "High") / sum(predictions_rf == "High")
recall <- sum(predictions_rf == "High" & test_set$Stream_cat == "High") / sum(test_set$Stream_cat == "High")
f1 <- 2 * (precision * recall) / (precision + recall)


# Print the F1 score
print(paste("F1 Score:", round(f1, 4)))

# Convert predictions to numeric
numeric_predictions <- as.numeric(predictions_rf == "High")

# Calculate and plot the ROC curve
roc_curve <- roc(test_set$Stream_cat, numeric_predictions)
plot(roc_curve, main = "ROC Curve", col = "blue")

roc_obj <- roc(test_set$Stream_cat, numeric_predictions)
auc_score <- auc(roc_obj)
auc_score

# Make predictions on the entire dataset
predictions_data <- predict(model_rf, newdata = cleaned_spotify_youtube_data)

library(caret)
confusionMatrix(predictions_data, reference = cleaned_spotify_youtube_data$Stream_cat)

#Accuracy
accuracy_rf <- mean(predictions_data == cleaned_spotify_youtube_data$Stream_cat)
print(paste("Random Forest Accuracy (Entire Dataset):", round(accuracy_rf, 4)))


#Evaluating model
importance(model_rf)

#Visualizing variable importance
varImpPlot(model_rf)