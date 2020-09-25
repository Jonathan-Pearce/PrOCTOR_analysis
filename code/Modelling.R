library(caret)
library(gbm)

dfFinal

#sort by response
newdata = dfFinal[order(-dfFinal$response),] 

train = newdata[c(1:40,257:300),]
test = newdata[c(41:56,57:256,301:846),]


####BOOSTING
gbmModel = gbm(formula = simplefmla,
               distribution = "bernoulli",
               data = train,
               n.trees = 2550,
               shrinkage = .1,
               cv.folds = 5)

gbmTrainPredictions = predict(object = gbmModel,
                              newdata = test,
                              n.trees = 50,
                              type = "response")

head(data.frame("Actual" = test$response, 
                "PredictedProbability" = gbmTrainPredictions))

confusion.matrix(test$response,gbmTrainPredictions,threshold=0.5)
auc(test$response,gbmTrainPredictions)
############


#######Random Forest
fit.rf =  randomForest(formula = simplefmla, data = train,importance=TRUE, ntree=2500)
Prediction <- predict(fit.rf, test)
LogLossBinary(test$response, Prediction)

confusion.matrix(test$response,Prediction,threshold=0.5)
auc(test$response,Prediction)
