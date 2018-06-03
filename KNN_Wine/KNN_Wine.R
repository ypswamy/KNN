library(caret)

wine_df <- read.csv("C:/Users/Pandu/Desktop/Pandu_ course/CASE_STUDY/KNN_Wine/wine.data", header = FALSE)
dim(wine_df)
nrow(wine_df)
summary(wine_df)
str(wine_df)
head(wine_df)
names(wine_df)

set.seed(3033)
intrain <- createDataPartition(y = wine_df$V1, p= 0.7, list = FALSE)
training <- wine_df[intrain,]
testing <- wine_df[-intrain,]

dim(training)
dim(testing)

anyNA(wine_df)
training[["V1"]] = factor(training[["V1"]])
testing[["V1"]] = factor(testing[["V1"]])

#Caret package provides train() method for training our data for various algorithms. We just need to #pass different parameter values for different algorithms. Before train() method, we will first use #trainControl() method. It controls the computational nuances of the train() method.
#use repeatedcv i.e, repeated cross-validation.

trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)
knn_fit <- train(V1 ~., data = training, method = "knn",
 trControl=trctrl,
 preProcess = c("center", "scale"),
 tuneLength = 10)
 
#Here, our training model is choosing k = 21 as its final value.
knn_fit

test_pred <- predict(knn_fit, newdata = testing)
test_pred

#Using confusion matrix, we can print statistics of our results. 
#It shows that our model accuracy for test set is 100%

confusionMatrix(test_pred, testing$V1 )