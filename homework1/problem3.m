mask = fspecial('sobel');

micro_img = imread('microboes.jpg');
micro_img = rgb2gray(micro_img);

micro_gs = imfilter(micro_img, mask);

micro_gs2 = abs(micro_gs) > 0.2*abs(max(micro_gs(:)));
micro_gs5 = abs(micro_gs) > 0.5*abs(max(micro_gs(:)));

pen_img = imread('input17.png');

pen_gs = imfilter(pen_img, mask);

pen_gs2 = abs(pen_gs) > 0.9*abs(max(pen_gs(:)));

subplot(2,2,1), imshow(micro_gs2)
subplot(2,2,2), imshow(micro_gs5)
subplot(2,2,3), imshow(pen_gs)
subplot(2,2,4), imshow(pen_gs2);