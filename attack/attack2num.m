function data = attack2num(arg)
    %% For Probing Attacks
    if(strcmp(arg,'nmap') == 1)
        if(isinteger(arg))
            data = 'nmap';
        else
            data = 1;
        end;
    elseif(strcmp(arg,'portsweep') == 1)
        if(isinteger(arg))
            data = 'portsweep';
        else
            data = 2;
        end;
    elseif(strcmp(arg,'ipsweep') == 1)
        if(isinteger(arg))
            data = 'ipsweep';
        else
            data = 3;
        end;
    elseif(strcmp(arg,'satan') == 1)
        if(isinteger(arg))
            data = 'satan';
        else
            data = 4;
        end;
    %% For Remote to Local Attacks
    elseif(strcmp(arg,'spy') == 1)
        if(isinteger(arg))
            data = 'spy';
        else
            data = 5;
        end;
    elseif(strcmp(arg,'phf') == 1)
        if(isinteger(arg))
            data = 'phf';
        else
            data = 6;
        end;
    elseif(strcmp(arg,'multihop') == 1)
        if(isinteger(arg))
            data = 'multihop';
        else
            data = 7;
        end;
    elseif(strcmp(arg,'ftp_write') == 1)
        if(isinteger(arg))
            data = 'ftp_write';
        else
            data = 8;
        end;
    elseif(strcmp(arg,'imap') == 1)
        if(isinteger(arg))
            data = 'imap';
        else
            data = 9;
        end;
    elseif(strcmp(arg,'warezmaster') == 1)
        if(isinteger(arg))
            data = 'warezmaster';
        else
            data = 10;
        end;
    elseif(strcmp(arg,'guess_password') == 1)
        if(isinteger(arg))
            data = 'guess_password';
        else
            data = 11;
        end;
    else 
        data = 0;
    end;
end