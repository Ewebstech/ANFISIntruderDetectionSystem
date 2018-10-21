function txt = vardump(varargin)
%VARDUMP Dump variables into one string (similar to var_dump from PHP)
%   TXT = VARDUMP(a,b,c,...) generates a string where each input argument
%   is displayed in the format of 'varname = value'.
%
%   TXT = VARDUMP('all') dumps the whole workspace into a string. Please be
%   careful when dumping large matrices. The variable 'ans' is omitted in
%   the ouput.
%
%   Examples
%      a = 10;
%      b = 'text';
%      vardump(a,b)
%
%      vardump('all');

txt = cell(nargin,1);
if nargin == 1 && strcmp(varargin{1},'all')
    ws = evalin('base', 'whos');    
    for i = 1:size(ws,1)
        if ~strcmp(ws(i).name,'ans')
            txt{i} = [sprintf('%s = ',ws(i).name) evalc('disp(evalin(''base'',ws(i).name))')];
        end
    end    
else
    for i = 1:nargin
        txt{i} = [sprintf('%s = ',inputname(i)) evalc('disp(varargin{i})')];
    end
end
txt = horzcat(txt{:});
