clc;
clear;
close all;

img = imread('panda.jpg');
gray = rgb2gray(img);
bw1 = imbinarize(gray);
bw2 = imcomplement(bw1);
bw3 = imfill(bw2, 'holes');

img2 = imread('space.jpg');
img2 = imresize(img2,[size(img,1) size(img,2)]);

img_red = img(:,:,1);
img_green = img(:,:,2);
img_blue = img(:,:,3);

img_red2 = img2(:,:,1);
img_green2 = img2(:,:,2);
img_blue2 = img2(:,:,3);

img_red2(bw3) = img_red(bw3);
img_green2(bw3) = img_green(bw3);
img_blue2(bw3) = img_blue(bw3);

rgb = cat(3,img_red2,img_green2,img_blue2);

subplot(3,3,1), imshow(img); title('Citra Asli');
subplot(3,3,2), imshow(gray); title('Citra Grayscale');
subplot(3,3,3), imshow(bw1); title('Citra Biner');
subplot(3,3,4), imshow(bw2); title('Citra Hasil Komplemen');
subplot(3,3,5), imshow(bw3); title('Citra Hasil Morfologi');
subplot(3,3,6), imshow(img2); title('Citra Background');
subplot(3,3,8), imshow(rgb); title('Citra Hasil');