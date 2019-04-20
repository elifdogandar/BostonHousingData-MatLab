%importing boston data
filename = 'boston.txt';
delimiterIn = ' ';
BO = importdata(filename,delimiterIn);
%standardizing the data
%BO=BO./std(BO,0,1);
%dividing boston data into training and test
%choosing 450 instance rows without repetition to put in training set
[M,N]= size(BO);
r = randperm(M,450);
training_data= BO(r, :);
%picking data which are not in training set and put in test data, which
%won't be used till the end
nr = setdiff( 1:M , r);
test_data= BO(nr,:);
%seperate predictors and dependent variable
trainingx=  training_data(:,1:N-1);
trainingy= training_data(:,N);
testx=  test_data(:,1:N-1);
testy= test_data(:,N);
figure;
plotmatrix(BO);
saveas(gcf,'plotmatrix.png')
figure;
%finding correlations between features
R= corrcoef(training_data(:,:));
imagesc(R);
caxis([-1,1]);
colorbar
saveas(gcf,'correlationimage.png')