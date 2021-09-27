img = imread('R.jpg');
img = rgb2gray(img);

[LoD, HiD, LoR, HiR] = wfilters('haar');
[c, s] = wavedec2(img, 2, LoD, HiD);

figure(1);
wavedisplay(c, s, 20);

[nc,~] = wavecut('a', c, s, 1);
[nc,~] = wavecut('v', nc, s, 1);
[nc,~] = wavecut('h', nc, s, 1);
[nc,~] = wavecut('a', nc, s, 2);
[nc,~] = wavecut('h', nc, s, 2);
[nc,~] = wavecut('d', nc, s, 2);
[nc,~] = wavecut('v', nc, s, 2);
i = waveback(nc, s, 'haar');
ddet = im2uint8(mat2gray(i));

% Reconstruct this by zeroing everything but it and reconstruct it
[nc,~] = wavecut('a', c, s, 1);
[nc,~] = wavecut('v', nc, s, 1);
[nc,~] = wavecut('h', nc, s, 1);
[nc,~] = wavecut('d', nc, s, 1);
[nc,~] = wavecut('a', nc, s, 2);
[nc,~] = wavecut('v', nc, s, 2);
[nc,~] = wavecut('h', nc, s, 2);
i = waveback(nc, s, 'haar');
ddet2 = im2uint8(mat2gray(i));

K = imabsdiff(ddet,ddet2);

figure(2),
subplot(1, 3, 1), imshow(ddet), title('Scale 1')
subplot(1, 3, 2), imshow(ddet2), title('Scale 2')
subplot(1, 3, 3), imshow(K), title('Difference');

