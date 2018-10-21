function [V, newX, D, X, out_fis,error,chkError,Data,CI,Attack_Traffic] = r2l(Failed_Login,UsePCA)
% Unauthorized access from a remote machine, the attacker 
% intrudes into a remote machine and gains local access of 
% the victim machine. E.g. password guessing Relevant features:
% Network level features – “duration of connection” and “service requested”
% and host level features - “number of failed login attempts”

X = Failed_Login(:); 
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
type = 'Remote To Local Attack Detection';
[out_fis,error,chkError,Data] = train_anfis(data,type);
[ CI, Attack_Traffic ] = prediction(data,type,UsePCA);
end

