function [Duration_of_Conn,Protocol_Type,Service,Flag,Source_Bytes,Dest_Bytes,Failed_Login,Status] = importfile(filename, startRow, endRow)
%IMPORTFILE1 Import numeric data from a text file as column vectors.
%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: double (%f)
%	column2: text (%s)
%   column3: text (%s)
%	column4: text (%s)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
%   column21: double (%f)
%	column22: double (%f)
%   column23: double (%f)
%	column24: double (%f)
%   column25: double (%f)
%	column26: double (%f)
%   column27: double (%f)
%	column28: double (%f)
%   column29: double (%f)
%	column30: double (%f)
%   column31: double (%f)
%	column32: double (%f)
%   column33: double (%f)
%	column34: double (%f)
%   column35: double (%f)
%	column36: double (%f)
%   column37: double (%f)
%	column38: double (%f)
%   column39: double (%f)
%	column40: double (%f)
%   column41: double (%f)
%	column42: text (%s)
%   column43: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%s%s%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%s%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
Duration_of_Conn = dataArray{:, 1};
Protocol_Type = dataArray{:, 2};
Service = dataArray{:, 3};
Flag = dataArray{:, 4};
Source_Bytes = dataArray{:, 5};
Dest_Bytes = dataArray{:, 6};
Failed_Login = dataArray{:, 11};
Status = dataArray{:, 41};

% VarName1 = dataArray{:, 1};
% tcp = dataArray{:, 2};
% ftp_data = dataArray{:, 3};
% SF = dataArray{:, 4};
% VarName5 = dataArray{:, 5};
% VarName6 = dataArray{:, 6};
% VarName7 = dataArray{:, 7};
% VarName8 = dataArray{:, 8};
% VarName9 = dataArray{:, 9};
% VarName10 = dataArray{:, 10};
% VarName11 = dataArray{:, 11};
% VarName12 = dataArray{:, 12};
% VarName13 = dataArray{:, 13};
% VarName14 = dataArray{:, 14};
% VarName15 = dataArray{:, 15};
% VarName16 = dataArray{:, 16};
% VarName17 = dataArray{:, 17};
% VarName18 = dataArray{:, 18};
% VarName19 = dataArray{:, 19};
% VarName20 = dataArray{:, 20};
% VarName21 = dataArray{:, 21};
% VarName22 = dataArray{:, 22};
% VarName23 = dataArray{:, 23};
% VarName24 = dataArray{:, 24};
% VarName25 = dataArray{:, 25};
% VarName26 = dataArray{:, 26};
% VarName27 = dataArray{:, 27};
% VarName28 = dataArray{:, 28};
% VarName29 = dataArray{:, 29};
% VarName30 = dataArray{:, 30};
% VarName31 = dataArray{:, 31};
% VarName32 = dataArray{:, 32};
% VarName33 = dataArray{:, 33};
% VarName34 = dataArray{:, 34};
% VarName35 = dataArray{:, 35};
% VarName36 = dataArray{:, 36};
% VarName37 = dataArray{:, 37};
% VarName38 = dataArray{:, 38};
% VarName39 = dataArray{:, 39};
% VarName40 = dataArray{:, 40};
% VarName41 = dataArray{:, 41};
% normal = dataArray{:, 42};
% VarName43 = dataArray{:, 43};


