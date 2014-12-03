function lpf_img = LPF(img,D)

%Setting default values.
switch nargin
    case 1
    	D=50;
end

img = double(img);
img_fft=fftshift(fft2(img));
[m,n] = size(img);
var=D^2;
for i=1:m
    for j=1:n
        H(i,j)=exp(-(((i-m/2)^2 + (j-n/2)^2)/(2*var)));
    end
end
G=H.*img_fft;
lpf_img=ifft2(ifftshift(G));
