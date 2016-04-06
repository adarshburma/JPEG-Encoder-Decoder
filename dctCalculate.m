function imgOut = dctCalculate(imgIn, N, dct)
    if size(imgIn,3) > 1 % color image, more than one channel
        imgOut(:,:,1) = blockproc(imgIn(:,:,1),[N N],dct,'PadPartialBlocks',true);
        imgOut(:,:,2) = blockproc(imgIn(:,:,2),[N N],dct,'PadPartialBlocks',true);
        imgOut(:,:,3) = blockproc(imgIn(:,:,3),[N N],dct,'PadPartialBlocks',true);
        imgOut = imgOut(1:size(imgIn,1), 1:size(imgIn,2), :); % trim
    else % grayscale image, only one channel
        imgOut = blockproc(imgIn,[N N],dct,'PadPartialBlocks',true);
        imgOut = imgOut(1:size(imgIn,1), 1:size(imgIn,2)); % trim
    end
end