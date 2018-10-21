function [ out_fis,error,chkError,Data ] = train_anfis(data,type)
%PROBE_ANFIS Summary of this function goes here
%   Detailed explanation goes here
Model = data(:);
TimeStep = length(Model);
%% Define an initial FIS structure with five Gaussian input membership functions.
time_vector = 1:1:TimeStep; % Time Vector from 1 to T-1 
disp([type, ': Preparing to Train the Model...'])
trnData = [time_vector', Model];
%% Define an FIS structure with five bell-shaped input membership functions.
disp('Defining a FIS structure with fifty triangular shaped input membership functions')
numMFs = 50; % Number of Membership Functions
mfType = 'trimf'; % Triangular Membership Functions
in_fis = genfis1(trnData,numMFs,mfType);

% Train the FIS using epoch_n training epochs.
epoch_n = 200;  % Number of training epochs (iterations)
dispOpt(1) = 1; % ANFIS information, such as numbers of input and output membership functions
dispOpt(2) = 1; % Error values
dispOpt(3) = 1; % Step size at each parameter update
dispOpt(4) = 1; % Final results
disp([type ': Now Training the model with nsl_kdd dataset...'])
[out_fis,error,chkError] = anfis(trnData,in_fis,epoch_n,dispOpt);
Training_Error = error; Mean_squared_error = chkError;
table(Training_Error,Mean_squared_error)
% Compare the ANFIS output with the training data.
disp([type, ': Training Successful'])
figure 
plot(time_vector,Model,'*r',time_vector,evalfis(time_vector,out_fis),'.b')
xlabel('Time'), ylabel('bytes/s')
title('Comparison of Training Data and ANFIS data')
legend('Training Data','ANFIS Output')
figure 
p = plot(time_vector,Model,time_vector,evalfis(time_vector,out_fis))
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(1).Marker = 'o';
xlabel('Time'), ylabel('bytes/s')
title('Comparison of Training Data and ANFIS data')
legend('Training Data','ANFIS Output')
figure
subplot(2,1,1)
e = 1:1:epoch_n;
plot(e,error)
xlabel('Epochs'), ylabel('Error')
title('ANFIS Training data Error at each training epoch')
subplot(2,1,2)
plot(e,error)
xlabel('Epochs'), ylabel('Mean Squared Error')
title('Root mean squared checking data errors at each training epoch')
Data = evalfis(time_vector,out_fis);
end

