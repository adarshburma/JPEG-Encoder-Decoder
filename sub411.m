function imgYCBCR = sub411(imgYCBCR)
    Cb = imgYCBCR(:,:,2);
    Cr = imgYCBCR(:,:,3);
    [CbHeight, CbWidth] = size(Cb);
    [CrHeight, CrWidth] = size(Cr);
    
    for i=1:CbHeight
        for j=1:CbWidth
            if mod(j, 4) == 1
                color = Cb(i,j);
            end
            Cb(i,j) = color;
        end
    end
    
    for i=1:CrHeight
        for j=1:CrWidth
            if mod(j, 4) == 1
                color = Cr(i,j);
            end
            Cr(i,j) = color;
        end
    end
    
    imgYCBCR(:,:,2) = Cb;
    imgYCBCR(:,:,3) = Cr;