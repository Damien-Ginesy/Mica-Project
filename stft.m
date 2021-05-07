function [X, f, t] = stft(x,w,d,N_fft,Fs)
    
    M = floor(length(x)/d);
    X = zeros(N_fft,M);
    d=-1;
    for j = 1:M
        d=d+10;
        for i=1:N_fft
            if(i+d) > length(x)
                if(j ~= M)
                    for k = 1:N_fft-i
                        X(i+k,j) = x(i+k);
                    end
                else
                    X(i:N_fft,M) = 0;
                end
                break
            end
            X(i,j) = x(i+d);
        end
    end
    X = X*w;
    X = fft(X,N_fft);
    
    
    