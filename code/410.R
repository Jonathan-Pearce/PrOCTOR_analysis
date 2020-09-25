library(gbm)
library(plyr)
library(randomForest)
library(SDMTools)
library(ROCR)
library(MLmetrics)

fullFmla = response ~ MolecularWeight + XLogP + HydrogenBondDonorCount + 
  HydrogenBondAcceptorCount + PolarSurfaceArea + FormalCharge + 
  NumRings + RotatableBondCount + Refractivity + XLogP + lossFreq + 
  maxBtwn + maxDegree + nTargets + wQED + PC1 + PC2 + PC3

smallFmla = response ~ PolarSurfaceArea + PC1 + wQED + maxDegree



#read raw data
rawData<-read.csv("/Users/jaypearce9/Desktop/Classes/Math_410/test.csv",header=TRUE)
#turn into dataframe
df.toxic = adply(rawData,1)

#sort by response
df.toxicSort = df.toxic[order(-df.toxic$response),] 

#data
x5 = sample(1:86, 60, replace=FALSE)
x6 = sample(87:846, 60, replace=FALSE)
train = df.toxicSort[c(x5,x6),]
test = df.toxicSort[-c(x5,x6),]
#just to check that train is balanced
table(train$response)
table(test$response)

#Boosting
gbmModel = gbm(formula = smallFmla,
               distribution = "bernoulli",
               data = train,
               n.trees = 10000,
               shrinkage = .001,
               interaction.depth = 6,
               cv.folds = 5)

bestIter = gbm.perf(gbmModel,method='cv',plot.it = TRUE)
bestIter

gbmTrainPredictions = predict(object = gbmModel,newdata = test,n.trees = bestIter,type = "response")
confusion.matrix(test$response,gbmTrainPredictions,threshold=0.5)
x = auc(test$response,gbmTrainPredictions)
x

pred <- prediction(gbmTrainPredictions,test$response)
roc.perf = performance(pred, measure = "tpr", x.measure = "fpr")
plot(roc.perf)
abline(a=0, b= 1)

auc.perf = performance(pred, measure = "auc")
auc.perf@y.values



#Random Forest
fit.rf =  randomForest(formula = simplefmla, data = train,importance=TRUE, ntree=50)
Prediction <- predict(fit.rf, test)
confusion.matrix(test$response,Prediction,threshold=0.5)
rfAUC = auc(test$response,Prediction)
rfAUC

pred <- prediction(Prediction,test$response)
roc.perf = performance(pred, measure = "tpr", x.measure = "fpr")
plot(roc.perf)
abline(a=0, b= 1)

auc.perf = performance(pred, measure = "auc")
auc.perf@y.values



##############
true = test$response

f1s = F1_Score(test$response, Prediction, positive = NULL)

pred <- prediction(Prediction, test$response);

# Recall-Precision curve             
RP.perf <- performance(pred, "prec", "rec");

plot (RP.perf)

f1 = performance(pred,"f")
plot(f1)

fmla2 = response ~ MolecularWeight + XLogP + HydrogenBondDonorCount +  HydrogenBondAcceptorCount + PolarSurfaceArea + FormalCharge +  NumRings + RotatableBondCount + Refractivity + XLogP + lossFreq + maxBtwn + maxDegree + nTargets +wQED + PC1 + PC2 + PC3
