img = imread('input17.png');

padded = paddedsize(size(img));

filter = lpfilter('ideal', padded(1), padded(2), 5);

img1 = dftfilt(img, filter, 'symmetric');

F = ifftshift(filter);

filter2 = lpfilter('ideal', padded(1), padded(2), 20);

img2 = dftfilt(img, filter2, 'symmetric');

F2 = ifftshift(filter2);

filter3 = lpfilter('ideal', padded(1), padded(2), 50);

img3 = dftfilt(img, filter3, 'symmetric');

F3 = fft2(ifftshift(filter3));

subplot(4,2,1), imshow(img)
subplot(4,2,3), imshow(img1)
subplot(4,2,4), imshow(F)
subplot(4,2,5), imshow(img2)
subplot(4,2,6), imshow(F2)
subplot(4,2,7), imshow(img3)
subplot(4,2,8), imshow(F3);