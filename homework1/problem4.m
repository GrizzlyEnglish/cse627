img = imread('car.jpg');
img = rgb2gray(img);

twofiftysix = histeq(img, 256);
thirtytwo = histeq(img, 32);

subplot(3,3,1), imshow(img)
subplot(3,3,2), imhist(img, 256)
subplot(3,3,3), imhist(img, 32)
subplot(3,3,4), imshow(twofiftysix)
subplot(3,3,5), imhist(twofiftysix, 256)
subplot(3,3,6), imhist(twofiftysix, 32)
subplot(3,3,7), imshow(thirtytwo)
subplot(3,3,8), imhist(thirtytwo, 256)
subplot(3,3,9), imhist(thirtytwo, 32);