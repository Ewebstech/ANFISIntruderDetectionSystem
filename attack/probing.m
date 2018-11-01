function [V, newX, D, X, out_fis,error,chkError,Data,CI,Attack_Traffic] = probing(Source_Bytes,UsePCA)
% Surveillance and other probing attack?s objective is to gain information about 
% the remote victim   e.g. port scanning. Relevant features:
% “duration of connection” and “source bytes”  
X = Source_Bytes(:); 
disp('Applying Principal Component Analysis on the NSL_KDD Dataset...')
[V, newX, D] = myPCA(X);
disp(V)
disp('Data Reduced Using PCA...')
% Training for Conn_Duration
if(UsePCA == 1)
   data = X; 
else
   data = newX; 
end
type = 'Probing Attack Detection';
[out_fis,error,chkError,Data] = train_anfis(data,type);
[ CI, Attack_Traffic ] = prediction(data,type,UsePCA);
end

