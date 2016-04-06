function imgYCBCR = sub420(imgYCBCR)
    Cb = imgYCBCR(:,:,2);
    Cr = imgYCBCR(:,:,3);
    [CbHeight, CbWidth] = size(Cb);
    [CrHeight, CrWidth] = size(Cr);
    
    for i=1:CbHeight
        for j=1:CbWidth
            if mod(j, 2) == 1 && mod(i,2) == 1
                color = Cb(i,j);
            elseif mod (j, 2) == 1
                color = Cb(i-1,j);
            end
            Cb(i,j) = color;
        end
    end
    
    for i=1:CrHeight
        for j=1:CrWidth
            if mod(j, 2) == 1 && mod(i,2) == 1
                color = Cr(i,j);
            elseif mod (j, 2) == 1
                color = Cr(i-1,j);
            end
            Cr(i,j) = color;
        end
    end
    
    imgYCBCR(:,:,2) = Cb;
    imgYCBCR(:,:,3) = Cr;