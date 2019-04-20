mdlQuadraticC = fitcdiscr(trainingxC,trainingyC,'DiscrimType','pseudoquadratic');
testyQChat= predict(mdlQuadraticC, testxC);

confusionmat(testyC,testyQChat);
