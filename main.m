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

LPFimg_out1 = uint8(LPF(img,50));
LPFimg1_out1 = uint8(LPF(img1));
LPFimg2_out1 = uint8(LPF(img2));
LPFimg3_out1 = uint8(LPF(img3));
LPFimg4_out1 = uint8(LPF(img4));
LPFimg5_out1 = uint8(LPF(img5));

%%
%Plots
figure(1)
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
figure(2)
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
figure(3)
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
figure(4)
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
figure(5)
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
