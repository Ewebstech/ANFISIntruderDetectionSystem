function [ CI, A ] = prediction(AnfisData,type,UsePCA)
% Importing Test data [NSL_KDD Test Dataset]
filePath = 'NSL_KDD-master/KDDTest+.csv';
[Duration_of_Conn,Protocol_Type,Service,Flag,Source_Bytes...
    ,Dest_Bytes,Failed_Login,Status] = importfile(filePath);

[V, pcaX, D] = myPCA(Source_Bytes(:));
if(UsePCA == 1)
  RealTimeTrafficData = pcaX; % Y(t)
else
  RealTimeTrafficData = Source_Bytes(:); % Y(t)
end
Stat_traffic = AnfisData; % N(t)
% y(t) = N(t) - a(t), where a(t) is the attack traffic
for k = 1:length(AnfisData)
    Y_t(k) = RealTimeTrafficData(k);
    a_t(k) = Y_t(k) - Stat_traffic(k);
    
end
A = a_t;
T = length(AnfisData);
M = mean(A);
Std_A = std(A);
dof = T - 1; % degree of freedom
% Compute the confidence interval
disp(['Now computing the confidence interval of ' type])
ts = tinv([0.025  0.975],dof);
CI = M + ts* (Std_A/sqrt(T));
disp('CI Computed')
disp('----------------------------------------')
disp(['Sample Mean of A(t): ' num2str(M) ''])
disp('----------------------------------------')
disp(['Standard Deviation S(T): ' num2str(Std_A) ''])
disp('----------------------------------------')
disp(['Percentiles of the t-distribution: ' num2str(ts) ''])
disp('----------------------------------------')
disp(['Attack Confidence Interval: ' num2str(CI) ''])
disp('----------------------------------------')


end

