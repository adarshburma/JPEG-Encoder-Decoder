% Expects imgYCBCR to be a uint8, returns uint8
function imgRGB = ycbcrToRGB(imgYCBCR)
    imgRGB = double(imgYCBCR);
    
    Y = imgRGB(:,:,1);
    Cb = imgRGB(:,:,2);
    Cr = imgRGB(:,:,3);
    
    R = Y*1.000 + (Cb-128)*0.000 + (Cr-128)*1.403;
    G = Y*1.000 + (Cb-128)*-0.344 + (Cr-128)*-0.714;
    B = Y*1.000 + (Cb-128)*1.773 + (Cr-128)*0.000;   
    imgRGB(:,:,1) = R;
    imgRGB(:,:,2) = G;
    imgRGB(:,:,3) = B;
    
    imgRGB = uint8(imgRGB);
end