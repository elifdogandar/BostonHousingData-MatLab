%changing y from continuous values to values from the set 1,2,3 (which represents cheap, medium and expensive houses)
BOS=BO;
for i=1:506
if BO(i,14)<15
 BOS(i,14)=1;   
elseif BO(i,14)>=15 && BO(i,14)<=30
   BOS(i,14)=2;  
else
   BOS(i,14)=3;  
end
end
training_dataC= BOS(r, :);
nr = setdiff( 1:M , r);
test_dataC= BOS(nr,:);
trainingxC=  training_dataC(:,1:N-1);
trainingyC= training_dataC(:,N);
testxC=  test_dataC(:,1:N-1);
testyC= test_dataC(:,N);
mdlknn= fitcknn(trainingxC,trainingyC,'NumNeighbors',5,'Standardize',1);
testyChat= predict(mdlknn, testxC);

confusionmat(testyC,testyChat);
loss= ones(1,10);
kloss=ones(1,10);
for i= 1:10
mdlknn= fitcknn(trainingxC,trainingyC,'NumNeighbors',i,'Standardize',1)
    loss(i) = resubLoss(mdlknn);
CVmdlknn = crossval(mdlknn,'KFold',5);
kloss(i) = kfoldLoss(CVmdlknn);
end
plot(1:10,loss,'r');
hold on
plot(1:10,kloss);
saveas(gcf,'loss and kloss for knn different ks.png');
