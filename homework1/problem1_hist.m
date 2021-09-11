penquins = imread('input17.png');

micro = imread('microboes.jpg');
micro = rgb2gray(micro);

subplot(3,2,1), imshow(penquins)
subplot(3,2,2), imhist(penquins, 256)
subplot(3,2,3), imshow(micro)
subplot(3,2,4), imhist(micro, 256);