# Extending PrOCTOR with Gradient Boosting

## Jonathan Pearce, McGill University

### Math 410 Project (Winter 2018)

Over the past decade, the rate of drug attrition due to clinical trial failures has risen substantially. Unfortunately it is difficult to identify compounds that have unfavourable toxicity properties before conducting clinical trials. In 2016 Researchers from Cornell University developed a new data-driven approach (PrOCTOR) [1], that directly predicts the likelihood of toxicity in clinical trials using the random forest learning algorithm. Using the properties of a compounds targets and its structure as input, PrOCTOR is able to predict whether the drug will fail clinical trials due to toxicity. In this project I investigated the potential of modifying PrOCTOR’s prediction capabilities to be driven by gradient boosting instead of random forest. Previously, gradient boosting has been found to be more successful at prediction in general than random forest [2,3]. During this project we conducted testing with gradient boosting models, both with the full feature set from our data as well as a reduced feature set. Further our own original testing with a random forest model was completed to aid in comparison between the two types of learning algorithms. Our gradient boosting version of PrOCTOR proved to be very effective and slightly outperformed the results of PrOCTOR in the selected evaluation metric. Follow up analysis’ concluded that the entire feature set was critical if one wants optimal performance from the model and further our gradient boosting model outperformed our random forest model on the same data further supporting the idea that gradient boosting is a more powerful tool at predicting drug failures in this setting.
