%deleting 10th feature
trainingx2= horzcat(trainingx(1:end,1:9),trainingx(1:end,11:end)); 
trainingy2= trainingy;
testx2= horzcat(testx(1:end,1:9),testx(1:end,11:end)); 
testy2= testy;

tree2 = fitrtree(trainingx2,trainingy2,'MaxNumSplits',6);
testyhat2= predict(tree2,testx2);
trainingyhat2=predict(tree2,trainingx2);
view(tree2,'mode','graph')

testerror2= (1/56)*sum((testy2-testyhat2).^2);
trainingerror2= (1/450)*sum((trainingy2-trainingyhat2).^2);