#add response
sample_drugs
#x4 = sample(c(0,1),size=846,prob=c(0.85,0.15),replace = TRUE)
x4 = c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0)
dataSet = cbind(sample_drugs, x4)
#dataSet = cbind('sample_drugs,', c())
dataSet

#removes spaces from column names
colnames(dataSet) <- c("MolecularWeight","XLogP","HydrogenBondDonorCount","HydrogenBondAcceptorCount","PolarSurfaceArea","FormalCharge","NumRings", "RotatableBondCount","Refractivity","XLogP","Ro5","Ghose","Veber","Blood","Skin","Brain","Testis","AdiposeTissue","Muscle","Nerve","BloodVessel","Heart","Lung","Esophagus","Kidney","Thyroid","Pituitary","Uterus","Pancreas","Vagina","Stomach","AdrenalGland","Colon","Prostate","Spleen","Liver","FallopianTube","Ovary","Breast","Bladder","CervixUteri","SmallIntestine","SalivaryGland","lossFreq","maxBtwn","maxDegree","nTargets","wQED","response")


response ~ MolecularWeight + XLogP + HydrogenBondDonorCount + 
  HydrogenBondAcceptorCount + PolarSurfaceArea + FormalCharge + 
  NumRings + RotatableBondCount + Refractivity + XLogP + Ro5 + 
  Ghose + Veber + Blood + Skin + Brain + Testis + AdiposeTissue + 
  Muscle + Nerve + BloodVessel + Heart + Lung + Esophagus + 
  Kidney + Thyroid + Pituitary + Uterus + Pancreas + Vagina + 
  Stomach + AdrenalGland + Colon + Prostate + Spleen + Liver + 
  FallopianTube + Ovary + Breast + Bladder + CervixUteri + 
  SmallIntestine + SalivaryGland + lossFreq + maxBtwn + maxDegree + 
  nTargets + wQED

newfmla = response ~ MolecularWeight + XLogP + HydrogenBondDonorCount + 
  HydrogenBondAcceptorCount + PolarSurfaceArea + FormalCharge + 
  NumRings + RotatableBondCount + Refractivity + XLogP + Ro5 + 
  Ghose + Veber + lossFreq + maxBtwn + maxDegree + 
  nTargets + wQED + PC1 + PC2 + PC3

simplefmla = response ~ PolarSurfaceArea + PC1 + wQED + maxDegree

#organize formula
colnames(df2)
xnam <- paste(colnames(df2)[2:49])
xnam
(fmla <- as.formula(paste("response ~ ", paste(xnam, collapse= "+"))))



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