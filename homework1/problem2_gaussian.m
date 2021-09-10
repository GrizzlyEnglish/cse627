imga = imread('microboes.jpg');
imga = rgb2gray(imga);

imgb = imread('input17.png');

padded = paddedsize(size(imga));

ga = imfilter(imga, fspecial('gaussian', [3 3], 5.0), 'corr', 'symmetric', 'same');
ga1 = imfilter(imga, fspecial('gaussian', [8 8], 2.0), 'corr', 'symmetric', 'same');

gb = imfilter(imgb, fspecial('gaussian', [3 3], 5.0), 'corr', 'symmetric', 'same');
gb1 = imfilter(imgb, fspecial('gaussian', [8 8], 2.0), 'corr', 'symmetric', 'same');

subplot(4,2,1), imshow(imga)
subplot(4,2,3), imshow(ga)
subplot(4,2,4), imshow(ga1)
subplot(4,2,5), imshow(imgb)
subplot(4,2,7), imshow(gb)
subplot(4,2,8), imshow(gb1);