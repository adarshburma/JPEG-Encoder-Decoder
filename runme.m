function runme(img_name,startRowNumber,startColumnNumber,blockSize,show444,show420,show411)
    imgRGB = imread(img_name);

    % Show original RGB image
    subplot(1,4,1);
    imshow(imgRGB);
    title('RGB');

    % Do YCBCR conversion, get back uint8
    imgYCBCR = rgbToYCBCR(imgRGB);
    % imgYCBCRmatlab = rgb2ycbcr(imgRGB);

    % 1. Image starts out with 8 bit integer values 0-255
    % 2. If we used im2double, we would be converting the 8-bit integer to a double, then dividing by 255. For example, 128 becomes 0.5
    % 3. Instead, I want to keep a 0-255 range, but increase precision by just converting to a double. For example, 128 becomes 128.0
    % 4. From now on when using imshow, must cast back to uint 8
    imgYCBCR = double(imgYCBCR);

    img444 = imgYCBCR;
    img411 = sub411(imgYCBCR);
    img420 = sub420(imgYCBCR);

    % subplot(2,4,2);
    % imshow(uint8(img444));
    % title('4:4:4');
    % 
    % subplot(2,4,3);
    % imshow(uint8(img411));
    % title('4:1:1');

    % subplot(2,4,4);
    % imshow(uint8(img420));
    % title('4:2:0');

    % 4:4:4
    img444 = dctConvert(img444,8,false);
    dctCoefficents444Y = img444(:,:,1);
    dctCoefficents444Cb = img444(:,:,2);
    dctCoefficents444Cr = img444(:,:,3);
    img444 = dctQuantization(img444,false);
    img444 = dctQuantization(img444,true);
    img444 = dctConvert(img444,8,true);
    img444 = uint8(img444);
    img444 = ycbcrToRGB(img444);

    subplot(1,4,2);
    imshow(img444);
    title('4:4:4 d,q,rgb');

    % 4:1:1
    img411 = dctConvert(img411,8,false);
    dctCoefficents411Y = img411(:,:,1);
    dctCoefficents411Cb = img411(:,:,2);
    dctCoefficents411Cr = img411(:,:,3);
    img411 = dctQuantization(img411,false);
    img411 = dctQuantization(img411,true);
    img411 = dctConvert(img411,8,true);
    img411 = uint8(img411);
    img411 = ycbcrToRGB(img411);

    subplot(1,4,3);
    imshow(img411);
    title('4:1:1 d,q,rgb');

    % 4:2:0
    img420 = dctConvert(img420,8,false);
    dctCoefficents420Y = img420(:,:,1);
    dctCoefficents420Cb = img420(:,:,2);
    dctCoefficents420Cr = img420(:,:,3);
    img420 = dctQuantization(img420,false);
    img420 = dctQuantization(img420,true);
    img420 = dctConvert(img420,8,true);
    img420 = uint8(img420);
    img420 = ycbcrToRGB(img420);

    subplot(1,4,4);
    imshow(img420);
    title('4:2:0 d,q,rgb');
    %compute errros and print them
    MSE = computeMSE(imgRGB,img420);
    PSNR = computePSNR(MSE);

    disp('MSE = ')
    disp(MSE)
    disp('PSNR = ')
    disp(PSNR)
    format bank
    y1 = ((startColumnNumber*blockSize)-blockSize)+1;
    length = blockSize * startColumnNumber;
    if(show444)
        disp('4:4:4 Y block coefficents');
        disp(dctCoefficents444Y(startRowNumber:blockSize,y1:length));
        disp('4:4:4 Cb block coefficents');
        disp(dctCoefficents444Cb(startRowNumber:blockSize,y1:length));
        disp('4:4:4 Cr block coefficents');
        disp(dctCoefficents444Cr(startRowNumber:blockSize,y1:length));
    end
    if(show411)
        disp('4:1:1 Y block coefficents');
        disp(dctCoefficents411Y(startRowNumber:blockSize,y1:length));
        disp('4:1:1 Cb block coefficents');
        disp(dctCoefficents411Cb(startRowNumber:blockSize,y1:length));
        disp('4:1:1 Cr block coefficents');
        disp(dctCoefficents411Cr(startRowNumber:blockSize,y1:length));
    end
    if(show420)
        disp('4:2:0 Y block coefficents');
        disp(dctCoefficents420Y(startRowNumber:blockSize,y1:length));
        disp('4:2:0 Cb block coefficents');
        disp(dctCoefficents420Cb(startRowNumber:blockSize,y1:length));
        disp('4:2:0 Cr block coefficents');
        disp(dctCoefficents420Cr(startRowNumber:blockSize,y1:length));
    end
end