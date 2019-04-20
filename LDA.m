mdlLinearC = fitcdiscr(trainingxC,trainingyC);
testyLChat= predict(mdlLinearC, testxC);

confusionmat(testyC,testyLChat)
