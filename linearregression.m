
lm = fitlm(trainingx,trainingy,'linear')
testyhatL= feval(lm,testx);
testerrorL= (1/56)*sum((testy-testyhatL).^2);
trainingxnew= horzcat(trainingx(:,1:2),trainingx(:,4:6),trainingx(:,8),trainingx(:,10:end));
testxnew= horzcat(testx(:,1:2),testx(:,4:6),testx(:,8),testx(:,10:end));
lmnew = fitlm(trainingxnew,trainingy,'linear');
testyhatLnew= feval(lmnew,testxnew);
testerrorLnew= (1/56)*sum((testy-testyhatLnew).^2);

lmQ = fitlm(trainingx,trainingy,'quadratic')
testyhatLQ= feval(lmQ,testx);
testerrorLQ= (1/56)*sum((testy-testyhatLQ).^2);

figure
plot(testy)
hold on
plot(testyhatLQ)
hold off
saveas(gcf,'testy and y hat of LQ.png')
