function ma_img = moving_avg(img)
img = double(img);
mask=[0 1 0;1 1 1;0 1 0];
ma_img=conv2(img,mask,'same');
