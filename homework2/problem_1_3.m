ogImg = imread('DIP.png');
img = imread('DIP_n3.png');

% Get a section of the image interactively
[B, c, r] = roipoly(img);

% Look at the histogram to determine the noise
[hist, npix] = histroi(img, c, r);

% Looks like exp? Try to get the hist from imnoise
[~, noise] = imnoise2(ones(npix, 1), 'rayleigh', .2, .002);
hist2 = imhist(noise);

% WRONG
figure(2), 
subplot(1, 2, 1), bar(hist, 1), title('Histogram of ROI'),
subplot(1, 2, 2), bar(hist2, 1), title('Estimated PDF');

% Just blurryin the noise, it is not too strong...
mid = spfilt(img, 'median', 3, 3);

K = imabsdiff(mid, ogImg);

figure(3),
subplot(1, 4, 1), imshow(img), title('Noisy Image')
subplot(1, 4, 2), imshow(mid), title('Median Filtered')
subplot(1, 4, 3), imshow(ogImg), title('Original')
subplot(1, 4, 4), imshow(K), title('Abs Diff (OG and Filtered)');