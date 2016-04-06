% Expects imgIn to be a double
function imgOut = dctConvert(imgIn, N, inverse)
    T = dctTransformMatrix(N);
    % T = dctmtx(N);
    if inverse == true
        dct = @(block_struct) T' * block_struct.data * T;
    else
        dct = @(block_struct) T * block_struct.data * T';
    end
    imgOut = dctCalculate(imgIn, N, dct);
end