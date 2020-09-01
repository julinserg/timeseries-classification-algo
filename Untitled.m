clc;
clear;
%http://www.mustafabaydogan.com/multivariate-time-series-discretization-for-classification.html
%https://www.groundai.com/project/the-uea-multivariate-time-series-classification-archive-2018/1
%http://www.timeseriesclassification.com/dataset.php
rng('default');
r1 = normrnd(3,10,[600,5]); %����������
r2 = lognrnd(3,10,[600,5]); %�������������
r3 = poissrnd(20,[600,5]); %��������
r4 = wblrnd(1/2,1/2,[600,5]); % �������
r5 = trnd(3,600,5); %���������
r6 = raylrnd(20,600,5); %�����
r7 = gamrnd(5,10,600,5); %�����
r8 = frnd(2,2,600,5); %������
r9 = evrnd(3,10,[600,5]); % (�������������)
r10 = exprnd(5,600,5); % ����������������
r11 = chi2rnd(6,[600,5]); % ��-�������
r12 = binornd(100,0.2,600,5); %������������
r13 = betarnd(10,10,[600,5]); %�����

r21 = getArrayExampleTrainData(1,1); % Arabic Digit 
r22 = getArrayExampleTrainData(1,2); % Character Trajectories  
r23 = getArrayExampleTrainData(1,7); % ADL Recognition with Wrist-worn Accelerometer 
r23 = r23(1:20000,:);
r24 = getArrayExampleTrainData(1,13); % Indoor User Movement 

javaaddpath('c:\Program Files\Weka-3-8-4\weka.jar');
wekaOBJ = loadARFF('d:\\git\\phd_codesourse\\Multivariate_arff\\CharacterTrajectories\\CharacterTrajectoriesDimension1_TRAIN.arff');
[mdata,featureNames,targetNDX,stringVals,relationName] = weka2matlab(wekaOBJ,[]);
                                            
Mskekur(r25,1,0.05,'Indoor User Movement');