function T = dctTransformMatrix(N)
    T = zeros(N,N);
    for m = 0:1:N-1
        for n = 0:1:N-1
            if n == 0
                k = sqrt(1/N);
            else
                k = sqrt(2/N);
            end
        T(n+1,m+1) = k*cos( ((2*m+1)*n*pi) / (2*N));
        end
    end
end