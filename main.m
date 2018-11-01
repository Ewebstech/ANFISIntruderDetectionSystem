% ANFIS Model
clear all; clc; close all;
global UsePCA showPCA
addpath(genpath('fileHandler/'));
addpath(genpath('attack/'));
addpath(genpath('train_anfis/'));
disp('-----------------------------------------------------------')
disp('-----------------------------------------------------------')
disp('*** ANFIS MODEL FOR ANOMALY INTRUSION DETECTION SYSTEM ***')
disp('-----------------------------------------------------------')
disp('-----------------------------------------------------------')

%% App Options & Settings
% Choose to use PCA for dimensionality reduction
UsePCA = 1 ; % 1=true, 0=false 
% Choose to show PCA result
showPCA = 1; % 1 =  true; false = 0

%% Import Data
filePath = 'NSL_KDD-master/SmallTrainingSet.csv';
Probing = 'probing';
R2L = 'r2l';
AttackType = R2L;
% [Duration_of_Conn,Protocol_Type,Service,Flag,Source_Bytes...
%     ,Dest_Bytes,Failed_Login,Status] = importfile(filePath);
OriginalData = importKDD(filePath)
Duration_of_Conn = OriginalData(:,1);
Source_Bytes = OriginalData(:,2);
Dest_Bytes = OriginalData(:,3);
Failed_Login = OriginalData(:,4);
% Attack_Status = Attack_Status(:);
% 
str1 = AttackType;
str2 = 'probing';
strcompare = strcmp(str1,str2);
if(strcompare > 0)
    [coeff, new_X, latent, X, out_fis,error,chkError,Data,CI,Attack_Traffic] = probing(Source_Bytes,UsePCA);
end

str1 = AttackType;
str2 = 'r2l';
strcompare = strcmp(str1,str2);
if(strcompare > 0)
    [coeff, new_X, latent, X, out_fis,error,chkError,Data,CI,Attack_Traffic] = probing(Failed_Login,UsePCA);
end



