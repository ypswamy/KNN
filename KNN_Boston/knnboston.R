# Load the data
data("Boston", package = "MASS")
# Inspect the data
sample_n(Boston, 3)
# Split the data into training and test set
set.seed(123)
training.samples <- Boston$medv %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- Boston[training.samples, ]
test.data <- Boston[-training.samples, ]

# Fit the model on the training set
set.seed(123)
model <- train(
  medv~., data = train.data, method = "knn",
  trControl = trainControl("cv", number = 10),
  preProcess = c("center","scale"),
  tuneLength = 10
  )
# Plot model error RMSE vs different values of k
plot(model)

# Best tuning parameter k that minimize the RMSE
model$bestTune
# Make predictions on the test data
predictions <- model %>% predict(test.data)
head(predictions)


#The best k is the one that minimize the prediction error RMSE (root mean squared error).

#The RMSE corresponds to the square root of the average difference between the observed #known outcome values and the predicted values, RMSE = mean((observeds - predicteds)^2) #%>% sqrt(). The lower the RMSE, the better the model.

# Compute the prediction error RMSE
RMSE(predictions, test.data$medv)