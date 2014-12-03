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

%%
%Median filter
m=3;
n=3;

MDimg_out1 = medfilt2(img, [m n]);

%%
%Anisotropic diffusion filter

ADimg_out1 = uint8(anisodiff(img,40,1/7,60,1));
ADimg_out2 = uint8(anisodiff(img,10,1/7,60,2));
ADimg_out3 = uint8(anisodiff(img,40,1/7,60,3));
ADimg_out4 = uint8(anisodiff(img,10,1/7,60,4));

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
figure(3)
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
figure(4)
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