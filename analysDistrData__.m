clc;
clear;
UCIDATASET = 11;
TRAINFOLDSIZE = 1;

dataTrainUCI = getTrainData(1,UCIDATASET);
dataTestUCI = getTestData(1,UCIDATASET);
%dataTrainRaw = dataTrainUCI(:,1:TRAINFOLDSIZE);
dataTrainRaw = {dataTrainUCI{1,1} dataTrainUCI{2,1} dataTrainUCI{3,1} dataTrainUCI{4,1} dataTrainUCI{5,1} dataTrainUCI{6,1} dataTrainUCI{8,1} dataTrainUCI{8,1} dataTestUCI{1,1} dataTestUCI{2,1} dataTestUCI{3,1} dataTestUCI{4,1} dataTestUCI{5,1} dataTestUCI{6,1} dataTestUCI{7,1} dataTestUCI{8,1}};
k = 1;
for i=1:size(dataTrainRaw,1)
    for j=1:size(dataTrainRaw,2)
        dataTrain{k,1} = dataTrainRaw{i,j};
        labelTrain(k,1) = i-1; 
        k = k+1;
    end;
end;

k_1 = 1;
dataTrainForClass = cell(size(dataTrainRaw,1),1);
for i=1:size(dataTrain,1)  
    u = size(dataTrain{i},2);
    a = dataTrain{i};
    t = size(dataTrainForClass{labelTrain(i)+1},2) +1;        
    dataTrainForClass{labelTrain(i)+1}(:,t:t+u-1) = a;       
    k_1 = k_1+size(a,2);  
end;

%% /////////////////////////////////
A = dataTrainForClass{1,1};
patterns = A(:,:)';
for i=1:size(patterns,2)
   minV = min(patterns(:,i));
   maxV = max(patterns(:,i));
   patterns(:,i) = (patterns(:,i) - minV) / (maxV - minV); 
end;
save('saveDataGMM','patterns');
patterns = patterns(:,:);
%Roystest(patterns);
%HZmvntest(patterns);
Mskekur(patterns,1);
x = A(1,:);
minX = min(x);
maxX = max(x);
x = (x - minX) / (maxX - minX);
dfittool(x)
%% \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\