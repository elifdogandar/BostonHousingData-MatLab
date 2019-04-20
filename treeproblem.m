%checking the effect of the maximum number of splits on the loss
kfoldLofTrees = ones(1,40);
ResubLofTrees = ones(1,40);
for n = 1:40
tree1 = fitrtree(trainingx,trainingy,'MaxNumSplits',n);
ResubLofTrees(n) = resubLoss(tree1);
CVtree1 = crossval(tree1);
L = kfoldLoss(CVtree1);
kfoldLofTrees(n)=L;
end
figure
plot(1:n,kfoldLofTrees);
hold on
plot(1:n,ResubLofTrees)
hold off
saveas(gcf,'kfold and resub loss of trees.png')
tree1 = fitrtree(trainingx,trainingy,'MaxNumSplits',6);
testyhattree1= predict(tree1,testx);
trainingyhat1=predict(tree1,trainingx);
view(tree1,'mode','graph')

testerror1= (1/56)*sum((testy-testyhattree1).^2);
trainingerror1= (1/450)*sum((trainingy-trainingyhat1).^2);
plot(testy)
hold on
plot(testyhattree1)
hold off
saveas(gcf,'testy and testyhat of tree1.png')
optimizedtree1 = fitrtree(trainingx,trainingy,'OptimizeHyperparameters','all','MaxNumSplits',100);
view(optimizedtree1,'mode','graph');


testyhatoptimized1= predict(optimizedtree1,testx);
testerror1optimized= (1/56)*sum((testy-testyhatoptimized1).^2);