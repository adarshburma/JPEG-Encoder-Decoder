function psnr = computePSNR(MSE)
sqrtMSE = sqrt(MSE);
dividen = 255/sqrtMSE;
logValue = log10(dividen);
psnr = 20*logValue;
end