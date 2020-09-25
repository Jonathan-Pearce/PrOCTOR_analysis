library(dplyr) # for data manipulation
library(caret) # for model-building
#library(DMwR2) # for smote implementation
library(ROSE)
library(purrr) # for functional programming (map)
library(pROC) # for AUC calculations
library(gbm)
library(plyr)
library(SDMTools)

dfFinal
dfFinal$response = as.factor(dfFinal$response)

outcomeName <- 'response'
predictorsNames <- names(dfFinal)[names(dfFinal) != outcomeName]

#divide data
trainCaret <- dfFinal[1:423,]
testCaret <- dfFinal[-(1:423),]

trainRose = newdata[c(1:28,57:457),]
testRose = newdata[c(29:56,458:846),]

prop.table(table(testRose$response))

prop.table(table(dfFinal$response))

ctrl <- trainControl(method = "repeatedcv",
                     number = 10,
                     repeats = 5,
                     summaryFunction = twoClassSummary,
                     classProbs = TRUE)

set.seed(5627)

orig_fit <- train(simplefmla,
                  data = trainCaret,
                  method = "gbm",
                  verbose = TRUE,
                  metric = "ROC",
                  trControl = ctrl)

test_roc <- function(model, data) {
  
  roc(data$response,predict(model, data, type = "prob")[, data$response])
  
}

orig_fit %>%
  test_roc(data = testCaret) %>%
  auc()










#tutorial 2
objControl <- trainControl(method='cv', number=3, returnResamp='none', summaryFunction = twoClassSummary, classProbs = TRUE)

objModel <- train(trainCaret[,predictorsNames], trainCaret[,outcomeName], 
                  method='gbm', 
                  trControl=objControl,  
                  metric = "ROC",
                  preProc = c("center", "scale"))

print(objModel)


predictions <- predict(object=objModel, testCaret[,predictorsNames], type='raw')
head(predictions)
print(postResample(pred=predictions, obs=as.factor(testCaret[,outcomeName])))
auc <- roc(ifelse(testCaret[,outcomeName]==0,1,0), predictions[[2]])
print(auc$auc)



########ROSE shit
set.seed(9560)
rose_train <- ROSE(simplefmla, data  = trainRose)$data                         
table(rose_train$response)

randomSeed = 1337
set.seed(randomSeed)

gbmModel = gbm(formula = simplefmla,
               distribution = "bernoulli",
               data = rose_train,
               n.trees = 1000,
               cv.folds=10)

gbmTrainPredictions = predict(object = gbmModel,
                              newdata = testRose,
                              n.trees = 1500,
                              type = "response")

#gbmTrainPredictions = predict(object = gbmModel,newdata = df2, n.trees = 1500, type = "response")




head(data.frame("Actual" = testRose$response, 
                "PredictedProbability" = gbmTrainPredictions))

LogLossBinary(testRose$response, gbmTrainPredictions)
confusion.matrix(testRose$response,gbmTrainPredictions,threshold=0.5)
auc(testRose$response,gbmTrainPredictions)

#######END OF TESTING


#savour code
feature.names=names(trainCaret)
i = 1
for (f in feature.names) {
  if (i == 1){
    
  }
  else{
    if (class(trainCaret[[f]])=="factor") {
      levels <- unique(c(trainCaret[[f]]))
      trainCaret[[f]] <- factor(trainCaret[[f]],
                                labels=make.names(levels))
    }
  }
  i = 2
}
#savour code
feature.names=names(testCaret)
i = 1
for (f in feature.names) {
  if (i == 1){
    
  }
  else{
    if (class(testCaret[[f]])=="factor") {
      levels <- unique(c(testCaret[[f]]))
      testCaret[[f]] <- factor(testCaret[[f]],
                                labels=make.names(levels))
    }
  }
  i = 2
}
