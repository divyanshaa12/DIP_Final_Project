clear; close all; clc;

%%
%Reading the images

img=rgb2gray(imread('bm.tif'));
img1=rgb2gray(imread('Brain_sv.tif'));
img2=rgb2gray(imread('Brain_tv.tif'));
img3=rgb2gray(imread('Knee.tif'));
img4=rgb2gray(imread('shoulder.tif'));
img5=rgb2gray(imread('spine.tif'));
%%
%Adding Noise
M=0;
V=0.02;
noise = imnoise(zeros(1024,1024),'gaussian',M,V);
img = imnoise(img,'gaussian',M,V);
img1 = imnoise(img1,'gaussian',M,V);
img2 = imnoise(img2,'gaussian',M,V);
img3 = imnoise(img3,'gaussian',M,V);
img4 = imnoise(img4,'gaussian',M,V);
img5 = imnoise(img5,'gaussian',M,V);

%%
%Anisotropic diffusion filter

ADimg_out1 = uint8(anisodiff(img,40,1/7,60,1));
ADimg_out2 = uint8(anisodiff(img,10,1/7,60,2));
ADimg_out3 = uint8(anisodiff(img,40,1/7,60,3));
ADimg_out4 = uint8(anisodiff(img,10,1/7,60,4));

ADimg1_out1 = uint8(anisodiff(img1,40,1/7,60,1));
ADimg1_out2 = uint8(anisodiff(img1,10,1/7,60,2));
ADimg1_out3 = uint8(anisodiff(img1,40,1/7,60,3));
ADimg1_out4 = uint8(anisodiff(img1,10,1/7,60,4));

ADimg2_out1 = uint8(anisodiff(img2,40,1/7,60,1));
ADimg2_out2 = uint8(anisodiff(img2,10,1/7,60,2));
ADimg2_out3 = uint8(anisodiff(img2,40,1/7,60,3));
ADimg2_out4 = uint8(anisodiff(img2,10,1/7,60,4));

ADimg3_out1 = uint8(anisodiff(img3,40,1/7,60,1));
ADimg3_out2 = uint8(anisodiff(img3,10,1/7,60,2));
ADimg3_out3 = uint8(anisodiff(img3,40,1/7,60,3));
ADimg3_out4 = uint8(anisodiff(img3,10,1/7,60,4));

ADimg4_out1 = uint8(anisodiff(img4,40,1/7,60,1));
ADimg4_out2 = uint8(anisodiff(img4,10,1/7,60,2));
ADimg4_out3 = uint8(anisodiff(img4,40,1/7,60,3));
ADimg4_out4 = uint8(anisodiff(img4,10,1/7,60,4));

ADimg5_out1 = uint8(anisodiff(img5,40,1/7,60,1));
ADimg5_out2 = uint8(anisodiff(img5,10,1/7,60,2));
ADimg5_out3 = uint8(anisodiff(img5,40,1/7,60,3));
ADimg5_out4 = uint8(anisodiff(img5,10,1/7,60,4));

%%
%Median filter
m=5;
n=5;

MDimg_out1 = uint8(medfilt2(img, [m n]));
MDimg1_out1 = uint8(medfilt2(img1, [m n]));
MDimg2_out1 = uint8(medfilt2(img2, [m n]));
MDimg3_out1 = uint8(medfilt2(img3, [m n]));
MDimg4_out1 = uint8(medfilt2(img4, [m n]));
MDimg5_out1 = uint8(medfilt2(img5, [m n]));

%%
%Moving Average filter

MAimg_out1 = uint8(moving_avg(img));
MAimg1_out1 = uint8(moving_avg(img1));
MAimg2_out1 = uint8(moving_avg(img2));
MAimg3_out1 = uint8(moving_avg(img3));
MAimg4_out1 = uint8(moving_avg(img4));
MAimg5_out1 = uint8(moving_avg(img5));

%%
%Moving Average filter

LPFimg_out1 = uint8(LPF(img));
LPFimg1_out1 = uint8(LPF(img1));
LPFimg2_out1 = uint8(LPF(img2));
LPFimg3_out1 = uint8(LPF(img3));
LPFimg4_out1 = uint8(LPF(img4));
LPFimg5_out1 = uint8(LPF(img5));

%%
%SNR Calculations
snr_ADimg_out1 = psnr(ADimg_out1,uint8(imnoise(zeros(size(ADimg_out1)),'gaussian',M,V)));
snr_ADimg_out2 = psnr(ADimg_out2,uint8(imnoise(zeros(size(ADimg_out2)),'gaussian',M,V)));
snr_ADimg_out3 = psnr(ADimg_out3,uint8(imnoise(zeros(size(ADimg_out3)),'gaussian',M,V)));
snr_ADimg_out4 = psnr(ADimg_out4,uint8(imnoise(zeros(size(ADimg_out4)),'gaussian',M,V)));

snr_ADimg1_out1 = psnr(ADimg1_out1,uint8(imnoise(zeros(size(ADimg1_out1)),'gaussian',M,V)));
snr_ADimg1_out2 = psnr(ADimg1_out2,uint8(imnoise(zeros(size(ADimg1_out2)),'gaussian',M,V)));
snr_ADimg1_out3 = psnr(ADimg1_out3,uint8(imnoise(zeros(size(ADimg1_out3)),'gaussian',M,V)));
snr_ADimg1_out4 = psnr(ADimg1_out4,uint8(imnoise(zeros(size(ADimg1_out4)),'gaussian',M,V)));

snr_ADimg2_out1 = psnr(ADimg2_out1,uint8(imnoise(zeros(size(ADimg2_out1)),'gaussian',M,V)));
snr_ADimg2_out2 = psnr(ADimg2_out2,uint8(imnoise(zeros(size(ADimg2_out2)),'gaussian',M,V)));
snr_ADimg2_out3 = psnr(ADimg2_out3,uint8(imnoise(zeros(size(ADimg2_out3)),'gaussian',M,V)));
snr_ADimg2_out4 = psnr(ADimg2_out4,uint8(imnoise(zeros(size(ADimg2_out4)),'gaussian',M,V)));

snr_ADimg3_out1 = psnr(ADimg3_out1,uint8(imnoise(zeros(size(ADimg3_out1)),'gaussian',M,V)));
snr_ADimg3_out2 = psnr(ADimg3_out2,uint8(imnoise(zeros(size(ADimg3_out2)),'gaussian',M,V)));
snr_ADimg3_out3 = psnr(ADimg3_out3,uint8(imnoise(zeros(size(ADimg3_out3)),'gaussian',M,V)));
snr_ADimg3_out4 = psnr(ADimg3_out4,uint8(imnoise(zeros(size(ADimg3_out4)),'gaussian',M,V)));

snr_ADimg4_out1 = psnr(ADimg4_out1,uint8(imnoise(zeros(size(ADimg4_out1)),'gaussian',M,V)));
snr_ADimg4_out2 = psnr(ADimg4_out2,uint8(imnoise(zeros(size(ADimg4_out2)),'gaussian',M,V)));
snr_ADimg4_out3 = psnr(ADimg4_out3,uint8(imnoise(zeros(size(ADimg4_out3)),'gaussian',M,V)));
snr_ADimg4_out4 = psnr(ADimg4_out4,uint8(imnoise(zeros(size(ADimg4_out4)),'gaussian',M,V)));

snr_ADimg5_out1 = psnr(ADimg5_out1,uint8(imnoise(zeros(size(ADimg5_out1)),'gaussian',M,V)));
snr_ADimg5_out2 = psnr(ADimg5_out2,uint8(imnoise(zeros(size(ADimg5_out2)),'gaussian',M,V)));
snr_ADimg5_out3 = psnr(ADimg5_out3,uint8(imnoise(zeros(size(ADimg5_out3)),'gaussian',M,V)));
snr_ADimg5_out4 = psnr(ADimg5_out4,uint8(imnoise(zeros(size(ADimg5_out4)),'gaussian',M,V)));

snr_MDimg_out1 = psnr(MDimg_out1,uint8(imnoise(zeros(size(MDimg_out1)),'gaussian',M,V)));
snr_MDimg1_out1 = psnr(MDimg1_out1,uint8(imnoise(zeros(size(MDimg1_out1)),'gaussian',M,V)));
snr_MDimg2_out1 = psnr(MDimg2_out1,uint8(imnoise(zeros(size(MDimg2_out1)),'gaussian',M,V)));
snr_MDimg3_out1 = psnr(MDimg3_out1,uint8(imnoise(zeros(size(MDimg3_out1)),'gaussian',M,V)));
snr_MDimg4_out1 = psnr(MDimg4_out1,uint8(imnoise(zeros(size(MDimg4_out1)),'gaussian',M,V)));
snr_MDimg5_out1 = psnr(MDimg5_out1,uint8(imnoise(zeros(size(MDimg5_out1)),'gaussian',M,V)));

snr_MAimg_out1 = psnr(MAimg_out1,uint8(imnoise(zeros(size(MAimg_out1)),'gaussian',M,V)));
snr_MAimg1_out1 = psnr(MAimg1_out1,uint8(imnoise(zeros(size(MAimg1_out1)),'gaussian',M,V)));
snr_MAimg2_out1 = psnr(MAimg2_out1,uint8(imnoise(zeros(size(MAimg2_out1)),'gaussian',M,V)));
snr_MAimg3_out1 = psnr(MAimg3_out1,uint8(imnoise(zeros(size(MAimg3_out1)),'gaussian',M,V)));
snr_MAimg4_out1 = psnr(MAimg4_out1,uint8(imnoise(zeros(size(MAimg4_out1)),'gaussian',M,V)));
snr_MAimg5_out1 = psnr(MAimg5_out1,uint8(imnoise(zeros(size(MAimg5_out1)),'gaussian',M,V)));

snr_LPFimg_out1 = psnr(LPFimg_out1,uint8(imnoise(zeros(size(LPFimg_out1)),'gaussian',M,V)));
snr_LPFimg1_out1 = psnr(LPFimg1_out1,uint8(imnoise(zeros(size(LPFimg1_out1)),'gaussian',M,V)));
snr_LPFimg2_out1 = psnr(LPFimg2_out1,uint8(imnoise(zeros(size(LPFimg2_out1)),'gaussian',M,V)));
snr_LPFimg3_out1 = psnr(LPFimg3_out1,uint8(imnoise(zeros(size(LPFimg3_out1)),'gaussian',M,V)));
snr_LPFimg4_out1 = psnr(LPFimg4_out1,uint8(imnoise(zeros(size(LPFimg4_out1)),'gaussian',M,V)));
snr_LPFimg5_out1 = psnr(LPFimg5_out1,uint8(imnoise(zeros(size(LPFimg5_out1)),'gaussian',M,V)));

f = figure('Name','SNR Table','Position',[200 200 600 200]);
dat = [snr_ADimg_out1,snr_ADimg_out2,snr_MAimg_out1,snr_MDimg_out1,snr_LPFimg_out1;
       snr_ADimg1_out1,snr_ADimg1_out2,snr_MAimg1_out1,snr_MDimg1_out1,snr_LPFimg1_out1;
       snr_ADimg2_out1,snr_ADimg2_out2,snr_MAimg2_out1,snr_MDimg2_out1,snr_LPFimg2_out1;
       snr_ADimg3_out1,snr_ADimg3_out2,snr_MAimg3_out1,snr_MDimg3_out1,snr_LPFimg3_out1;
       snr_ADimg4_out1,snr_ADimg4_out2,snr_MAimg4_out1,snr_MDimg4_out1,snr_LPFimg4_out1;
       snr_ADimg5_out1,snr_ADimg5_out2,snr_MAimg5_out1,snr_MDimg5_out1,snr_LPFimg5_out1;
       ]; 
cnames = {'AD Filter(Option 1)','AD Filter(Option 2)','MA Filter','MD Filter','LPF Filter'};
rnames = {'Image 1','Image 2','Image 3','Image 4','Image 5','Image 6'};
t = uitable('Parent',f,'Data',dat,'ColumnName',cnames,'RowName',rnames,'Position',[20 20 560 180]);

%%
%Plots
figure('Name','AD Filter Image1')
subplot(3,2,1:2)
imshow(img)
title('Original')

subplot(3,2,3)
imshow(ADimg_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg_out4)
title('Option 4')

%%
figure('Name','AD Filter Image2')
subplot(3,2,1:2)
imshow(img1)
title('Original')

subplot(3,2,3)
imshow(ADimg1_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg1_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg1_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg1_out4)
title('Option 4')

%%
figure('Name','AD Filter Image3')
subplot(3,2,1:2)
imshow(img2)
title('Original')

subplot(3,2,3)
imshow(ADimg2_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg2_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg2_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg2_out4)
title('Option 4')

%%
figure('Name','AD Filter Image4')
subplot(3,2,1:2)
%%
%Plots
figure('Name','AD Filter Image1')
subplot(3,2,1:2)
imshow(img)
title('Original')

subplot(3,2,3)
imshow(ADimg_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg_out4)
title('Option 4')

%%
figure('Name','AD Filter Image2')
subplot(3,2,1:2)
imshow(img1)
title('Original')

subplot(3,2,3)
imshow(ADimg1_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg1_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg1_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg1_out4)
title('Option 4')

%%
figure('Name','AD Filter Image3')
subplot(3,2,1:2)
imshow(img2)
title('Original')

subplot(3,2,3)
imshow(ADimg2_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg2_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg2_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg2_out4)
title('Option 4')

%%
figure('Name','AD Filter Image4')
subplot(3,2,1:2)
%%
%Plots
figure('Name','AD Filter Image1')
subplot(3,2,1:2)
imshow(img)
title('Original')

subplot(3,2,3)
imshow(ADimg_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg_out4)
title('Option 4')

%%
figure('Name','AD Filter Image2')
subplot(3,2,1:2)
imshow(img1)
title('Original')

subplot(3,2,3)
imshow(ADimg1_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg1_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg1_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg1_out4)
title('Option 4')

%%
figure('Name','AD Filter Image3')
subplot(3,2,1:2)
imshow(img2)
title('Original')

subplot(3,2,3)
imshow(ADimg2_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg2_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg2_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg2_out4)
title('Option 4')

%%
figure('Name','AD Filter Image4')
subplot(3,2,1:2)
imshow(img3)
title('Original')

subplot(3,2,3)
imshow(ADimg3_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg3_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg3_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg3_out4)
title('Option 4')

%%
figure('Name','AD Filter Image5')
subplot(3,2,1:2)
imshow(img4)
title('Original')

subplot(3,2,3)
imshow(ADimg4_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg4_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg4_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg4_out4)
title('Option 4')

%%
figure('Name','AD Filter Image6')
subplot(3,2,1:2)
imshow(img5)
title('Original')

subplot(3,2,3)
imshow(ADimg5_out1)
title('Option 1')

subplot(3,2,4)
imshow(ADimg5_out2)
title('Option 2')

subplot(3,2,5)
imshow(ADimg5_out3)
title('Option 3')

subplot(3,2,6)
imshow(ADimg5_out4)
title('Option 4')

%%
figure('Name','Median Filter')
subplot(3,2,1)
imshow(MDimg_out1)
title('Original')

subplot(3,2,2)
imshow(MDimg1_out1)
title('Image 1')

subplot(3,2,3)
imshow(MDimg2_out1)
title('Image 2')

subplot(3,2,4)
imshow(MDimg3_out1)
title('Image 3')

subplot(3,2,5)
imshow(MDimg4_out1)
title('Image 4')

subplot(3,2,6)
imshow(MDimg5_out1)
title('Image 5')

%%
figure('Name','Moving Average Filter')
subplot(3,2,1)
imshow(MAimg_out1)
title('Original')

subplot(3,2,2)
imshow(MAimg1_out1)
title('Image 1')

subplot(3,2,3)
imshow(MAimg2_out1)
title('Image 2')

subplot(3,2,4)
imshow(MAimg3_out1)
title('Image 3')

subplot(3,2,5)
imshow(MAimg4_out1)
title('Image 4')

subplot(3,2,6)
imshow(MAimg5_out1)
title('Image 5')

%%
figure('Name','LPF Filter')
subplot(3,2,1)
imshow(LPFimg_out1)
title('Original')

subplot(3,2,2)
imshow(LPFimg1_out1)
title('Image 1')

subplot(3,2,3)
imshow(LPFimg2_out1)
title('Image 2')

subplot(3,2,4)
imshow(LPFimg3_out1)
title('Image 3')

subplot(3,2,5)
imshow(LPFimg4_out1)
title('Image 4')

subplot(3,2,6)
imshow(LPFimg5_out1)
title('Image 5')

%%
figure('Name','Image 1 Comparison')
subplot(2,2,1)
imshow(ADimg_out2)
title('AD Filter')

subplot(2,2,2)
imshow(MAimg_out1)
title('MA Filter')

subplot(2,2,3)
imshow(MDimg_out1)
title('MD Filter')

subplot(2,2,4)
imshow(LPFimg_out1)
title('LPF Filter')

%%
figure('Name','Image 2 Comparison')
subplot(2,2,1)
imshow(ADimg1_out2)
title('AD Filter')

subplot(2,2,2)
imshow(MAimg1_out1)
title('MA Filter')

subplot(2,2,3)
imshow(MDimg1_out1)
title('MD Filter')

subplot(2,2,4)
imshow(LPFimg1_out1)
title('LPF Filter')

%%
figure('Name','Image 3 Comparison')
subplot(2,2,1)
imshow(ADimg2_out2)
title('AD Filter')

subplot(2,2,2)
imshow(MAimg2_out1)
title('MA Filter')

subplot(2,2,3)
imshow(MDimg2_out1)
title('MD Filter')

subplot(2,2,4)
imshow(LPFimg2_out1)
title('LPF Filter')

%%
figure('Name','Image 4 Comparison')
subplot(2,2,1)
imshow(ADimg3_out2)
title('AD Filter')

subplot(2,2,2)
imshow(MAimg3_out1)
title('MA Filter')

subplot(2,2,3)
imshow(MDimg3_out1)
title('MD Filter')

subplot(2,2,4)
imshow(LPFimg3_out1)
title('LPF Filter')

%%
figure('Name','Image 5 Comparison')
subplot(2,2,1)
imshow(ADimg4_out2)
title('AD Filter')

subplot(2,2,2)
imshow(MAimg4_out1)
title('MA Filter')

subplot(2,2,3)
imshow(MDimg4_out1)
title('MD Filter')

subplot(2,2,4)
imshow(LPFimg4_out1)
title('LPF Filter')

%%
figure('Name','Image 6 Comparison')
subplot(2,2,1)
imshow(ADimg5_out2)
title('AD Filter')

subplot(2,2,2)
imshow(MAimg5_out1)
title('MA Filter')

subplot(2,2,3)
imshow(MDimg5_out1)
title('MD Filter')

subplot(2,2,4)
imshow(LPFimg5_out1)
title('LPF Filter')
