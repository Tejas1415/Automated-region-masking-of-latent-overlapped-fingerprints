clc
clear all
close all

tic
I4=imread('d34.jpg');
%I4=rgb2gray(I);
I2 = padarray(I4,[30, 30],255);
I6=imnoise(I2,'salt & pepper');
I3=im2double(I6);
figure
imshow(I3); title('I6');

f1= fspecial('average',20);
Y=filter2(f1,I2,'same');
figure
imshow(Y/255);
title('Y/255');

A=ones(size(Y));
H=A-(Y/255);

H12=filter2(f1,H,'valid');
H2=imresize(H12,size(I3));
figure,imshow(3*H2);title('3*h2');
H3=3.2*H2;

[x, y] = size(H2);

H4= zeros(x,y);
for i=1:x
    for j=1:y
      if H3(i,j) > 0.9
         H4(i,j) = H3(i,j);
      end
    end
end

figure,imshow(H4);title('h4');

BW3=H4;
%dilate H4
H5=edge(H4,'sobel');
BW4 = bwpropfilt(H5,'perimeter',1);
BW4=imdilate(BW4,ones(3,3));
figure,imshow(BW4);title('bw4');

H8=imfill(BW4,'holes');
figure,imshow(H8);title('H8');

[x, y]=size(I2);
H4= zeros(x,y);
for i=1:x
    for j=1:y
      if I2(i,j) > 254
         H4(i,j) = I2(i,j);
      end
    end
end
figure,imshow(H4);title('H4');

BW2=H4;
BW8=bwareaopen(BW2,5);
BW2=imdilate(BW8,ones(7,7));
figure,imshow(BW2);title('BW2');
BW2=im2double(BW2);
G=BW2+I3;
figure,imshow(G);title('g');

E=edge(BW2,'sobel');
E=imdilate(E,ones(3,3));
figure,imshow(E);title('E');

BW5 = bwpropfilt(E,'perimeter',1);
figure,imshow(BW5);title('BW5 initial');
BW5=imfill(BW5,'holes');
figure,imshow(BW5);title('BW5 final');

BW6=(~BW5)+BW3;
figure,imshow(BW6);title('Bw6');

se=strel('line',13,110);
C=imdilate(BW6,se);
figure,imshow(C);title('c');

E2=edge(C,'sobel');
figure,imshow(E2);title('e2');
E2=imdilate(E2,ones(3,3));
T=bwpropfilt(E2,'perimeter',1);
figure,imshow(T);title('T');

S=E2-T;
figure,imshow(S);title('S');
T=imdilate(T,ones(3,3));
A=imfill(T,'holes');
A2=imfill(S,'holes');

figure,imshow(A);
figure,imshow(A2);title('A and A2');

figure,imshow(imdilate(A,se));title('A dilated');
figure,imshow(imdilate(A2,se));title('A2 dilated');

A4=imdilate(A,se);
A3=imdilate(A2,se);

S2=immultiply(A3,I3);
figure,imshow(S2);title('s2');


S3=immultiply(A4,I3);
figure
imshow(S3);title('s3');

S4=immultiply(H8,I3);
figure
imshow(S4);title('s4');

Z=S4+S3+S2;
figure
imshow(Z);title('sum')

[x1, x2]= size(Z);
for i=1:x1
    for j=1:x2
        if Z(i,j) < 0.1
            Z(i,j)=1;
        end
    end
end

I2=im2double(I2);
figure,imshow(Z);title('improved z');

Z7=ssim(I3,Z);
Z8=psnr(I3,Z);
k1=toc;
