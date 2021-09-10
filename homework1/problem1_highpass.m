img = imread('microboes.jpg');
img = rgb2gray(img);

padded = paddedsize(size(img));

filter = hpfilter('ideal', padded(1), padded(2), 5);

img1 = dftfilt(img, filter, 'symmetric');

F = ifftshift(fft2(img1));

filter1 = hpfilter('ideal', padded(1), padded(2), 20);

img2 = dftfilt(img, filter, 'symmetric');

F2 = ifftshift(fft2(img2));

filter2 = hpfilter('ideal', padded(1), padded(2), 50);

img3 = dftfilt(img, filter, 'symmetric');

F3 = ifftshift(fft2(img3));

subplot(4,2,1), imshow(img)
subplot(4,2,3), imshow(img1)
subplot(4,2,4), imshow(F)
subplot(4,2,5), imshow(img2)
subplot(4,2,6), imshow(F2)
subplot(4,2,7), imshow(img3)
subplot(4,2,8), imshow(F3);