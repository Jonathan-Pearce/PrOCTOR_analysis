library(gbm)
library(plyr)
library(randomForest)
library(SDMTools)

#log loss function
LogLossBinary = function(actual, predicted, eps = 1e-15) {  
  predicted = pmin(pmax(predicted, eps), 1-eps)  
  - (sum(actual * log(predicted) + (1 - actual) * log(1 - predicted))) / length(actual)
}

#read raw data
rawData<-read.csv("/Users/jaypearce9/Desktop/rawData.csv",header=TRUE)
#turn into dataframe
df = adply(rawData,1)

write.csv(dfFinal,"/Users/jaypearce9/Desktop/fulldata.csv")


###PCA
#getting columns required for PCA
cols <- c(15:44)
cols
targetData = df[,cols]
targetData

#applying PCA with scaling
pcaData = prcomp(targetData, scale. = T)
names(pcaData)
pcaData
pcaData$rotation

pcaData$x

pcaData = pcaData$x[,1:3]


dfFinal = cbind(df,pcaData)





#divide data
train <- dfFinal[1:750,]
test <- dfFinal[-(1:750),]



#GBM implementation
#http://allstate-university-hackathons.github.io/PredictionChallenge2016/GBM
#
randomSeed = 1337
set.seed(randomSeed)

gbmModel = gbm(formula = simplefmla,
               distribution = "bernoulli",
               data = train,
               n.trees = 2500)
               #shrinkage = .1,
               #n.minobsinnode = 20,
               #cv.folds=5)

gbmTrainPredictions = predict(object = gbmModel,
                              newdata = test,
                              n.trees = 1500,
                              type = "response")

#gbmTrainPredictions = predict(object = gbmModel,newdata = df2, n.trees = 1500, type = "response")




head(data.frame("Actual" = test$response, 
                "PredictedProbability" = gbmTrainPredictions))

LogLossBinary(test$response, gbmTrainPredictions)
confusion.matrix(test$response,gbmTrainPredictions,threshold=0.5)
auc(test$response,gbmTrainPredictions)



#Random Forest
##http://trevorstephens.com/kaggle-titanic-tutorial/r-part-5-random-forests/
fit.rf =  randomForest(formula = simplefmla, data = train,importance=TRUE, ntree=50)

Prediction <- predict(fit.rf, test)

LogLossBinary(test$response, Prediction)


ref_data <- test['response']
predictions <- out_both[,"ttbModel"]
confusionMatrixFor_Neg1_0_1(ref_data, predictions)

out_fwd_row_pairs_only <- predictPairSummary(df2, gbmModel)

confusion.matrix(test$response,Prediction,threshold=0.5)

auc(df2$response,gbmTrainPredictions)
auc(test$response,Prediction)
