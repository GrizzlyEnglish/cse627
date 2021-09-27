ogImg = imread('DIP.png');
img = imread('DIP_n5.png');

f = tofloat(img);
F = fft2(f);
freqimg = fftshift(log(1 + abs(F)));

notchSpots = [
    183 75; 
    248 8; 
    313 31; 
    117 54; 
    54 28; 
    248 139; 
    280 106; 
    311 287; 
    215 299; 
    152 319; 
    344 299; 
    56 291; 
    24 275; 
    375 54; 
    405 67; 
    422 269; 
    342 212; 
    310 119; 
    338 77;
    74 15;
    ];

[M, N] = size(img);
F = cnotch('gaussian', 'reject', M, N, notchSpots, 3);
S = intensityScaling(fftshift(F).*(freqimg));

filtered = dftfilt(img, F);
filtered = im2uint8(filtered);

K = imabsdiff(filtered, ogImg);

freq = [
    0 100;
    30 70;
    ];
[rb, ~, noise] = imnoise3(M, N, freq);
noise = imdilate(noise, ones(3));

figure(2),
subplot(2, 4, 1), imshow(freqimg, []), title('FFT')
subplot(2, 4, 2), imshow(S), title('FFT Notches')
subplot(2, 4, 3), imshow(noise), title('FFT Notches')
subplot(2, 4, 5), imshow(img), title('Noisy Image')
subplot(2, 4, 6), imshow(filtered), title('Filtered Image')
subplot(2, 4, 7), imshow(ogImg), title('OG Image')
subplot(2, 4, 8), imshow(K), title('Abs Diff (OG and Filtered)')
impixelinfo;