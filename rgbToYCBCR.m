% Expects imgRGB to be a uint8, returns uint8
function imgYCBCR = rgbToYCBCR(imgRGB)
    imgRGB = im2double(imgRGB);
    % S = [0.229, 0.587, 0.144;
    %     -0.168736, -0.331264, 0.5;
    %     0.5, -0.418688, -0.081312];
    
    R = imgRGB(:,:,1);
    G = imgRGB(:,:,2);
    B = imgRGB(:,:,3);
    
    Y = R*0.229 + G*0.587 + B*0.144;
    Cb = R*-0.168736 + G*-0.331264 + B*0.5 + 0.5;
    Cr = R*0.5 + G*-0.418688 + B*-0.081312 + 0.5;   
    imgYCBCR(:,:,1) = Y;
    imgYCBCR(:,:,2) = Cb;
    imgYCBCR(:,:,3) = Cr;
    
    imgYCBCR = im2uint8(imgYCBCR);
end