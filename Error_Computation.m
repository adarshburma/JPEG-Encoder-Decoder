function [Luma_MSE,Luma_PSNR,Cb_MSE,Cb_PSNR,Cr_MSE,Cr_PSNR] = Error_Computation (I_411 , I)

I = double(I);
I_411 = double(I_411);
Luma_Img_dif = 0;
Luma_Img_energy = 0;
Cb_Img_dif = 0;
Cb_Img_energy = 0;
Cr_Img_dif = 0;
Cr_Img_energy = 0;

% Luma Error Computation

Luma_411 = I_411(:,:,1);
Luma_I = I(:,:,1);
for i = 1: size(Luma_411,1)-7
   for j = 1:size(Luma_411, 2)-7
        Luma_Img_dif  = Luma_Img_dif +((Luma_411(i,j)- Luma_I(i,j))*(Luma_411(i,j)- Luma_I(i,j)));
        Luma_Img_energy = Luma_Img_energy + Luma_411(i,j) * Luma_411(i,j);
   end
end
m = size(I_411,1)-7;
n = size(I_411,2)-7;
Luma_MSE = Luma_Img_dif / (m*n);
Luma_PSNR = 20*log10 (255/sqrt(Luma_MSE));

% Cb component Error Computation

Cb_411 = I_411(:,:,2);
Cb_I = I(:,:,2);
for i = 1: size(Cb_411,1)-7
   for j = 1:size(Cb_411, 2)-7
        Cb_Img_dif  = Cb_Img_dif +((Cb_411(i,j)- Cb_I(i,j))*(Cb_411(i,j)- Cb_I(i,j)));
        Cb_Img_energy = Cb_Img_energy + Cb_411(i,j) * Cb_411(i,j);
   end
end
m = size(Cb_411,1)-7;
n = size(Cb_411,2)-7;
Cb_MSE = Cb_Img_dif / (m*n);
Cb_PSNR = 20*log10 (255/sqrt(Cb_MSE));

% Cr component Error Computation

Cr_411 = I_411(:,:,3);
Cr_I = I(:,:,3);
for i = 1: size(Cr_411,1)-7
   for j = 1:size(Cr_411, 2)-7
        Cr_Img_dif  = Cr_Img_dif +((Cr_411(i,j)- Cr_I(i,j))*(Cr_411(i,j)- Cr_I(i,j)));
        Cr_Img_energy = Cr_Img_energy + Cr_411(i,j) * Cr_411(i,j);
   end
end
m = size(Cr_411,1)-7;
n = size(Cr_411,2)-7;
Cr_MSE = Cr_Img_dif / (m*n);
Cr_PSNR = 20*log10 (255/sqrt(Cr_MSE));
