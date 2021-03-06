ogImg = imread('DIP.png');
img = imread('DIP_n1.png');

% Get a section of the image interactively
[B, c, r] = roipoly(img);

% Look at the histogram to determine the noise
[hist, npix] = histroi(img, c, r);

% Looks like uniform? Try to get the hist from imnoise
[~, noise] = imnoise2(ones(npix, 1), 'uniform', .3, .5);
hist2 = imhist(noise);

figure(2), 
subplot(1, 2, 1), bar(hist, 1), title('Histogram of ROI'),
subplot(1, 2, 2), bar(hist2, 1), title('Estimated PDF');

% According to slides gmean is good for uniform
% After trying the means seems midpoint is the best
mid = spfilt(img, 'midpoint', 3, 4);
mid = mid - 50;

K = imabsdiff(mid, ogImg);

figure(3),
subplot(1, 4, 1), imshow(img), title('Noisy Image')
subplot(1, 4, 2), imshow(mid), title('Midpoint Filtered')
subplot(1, 4, 3), imshow(ogImg), title('Original Image')
subplot(1, 4, 4), imshow(K), title('Abs Diff (OG and Filtered)');
%DONE