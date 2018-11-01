function data = convertAttacks(arg)
    %% For Probing Attacks
    
    if((arg == 1))
        if(isinteger(arg))
            data = 'nmap';
        else
            data = 1;
        end;
    elseif((arg == 2))
        if(isinteger(arg))
            data = 'portsweep';
        else
            data = 2;
        end;
    elseif((arg == 3))
        if(isinteger(arg))
            data = 'ipsweep';
        else
            data = 3;
        end;
    elseif((arg == 4))
        if(isinteger(arg))
            data = 'satan';
        else
            data = 4;
        end;
    %% For Remote to Local Attacks
    elseif((arg == 5))
        if(isinteger(arg))
            data = 'spy';
        else
            data = 5;
        end;
    elseif((arg == 6))
        if(isinteger(arg))
            data = 'phf';
        else
            data = 6;
        end;
    elseif((arg == 7))
        if(isinteger(arg))
            data = 'multihop';
        else
            data = 7;
        end;
    elseif((arg == 8))
        if(isinteger(arg))
            data = 'ftp_write';
        else
            data = 8;
        end;
    elseif((arg == 9))
        if(isinteger(arg))
            data = 'imap';
        else
            data = 9;
        end;
    elseif((arg == 10))
        if(isinteger(arg))
            data = 'warezmaster';
        else
            data = 10;
        end;
    elseif((arg == 11))
        if(isinteger(arg))s
            data = 'guess_password';
        else
            data = 11;
        end;  
    else
        data = 'normal';
    end;
end