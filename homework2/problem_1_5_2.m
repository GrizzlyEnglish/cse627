ogImg = imread('DIP.png');
img = imread('DIP_n5.png');

% Get a section of the image interactively
[B, c, r] = roipoly(img);

% Look at the histogram to determine the noise
[hist, npix] = histroi(img, c, r);

% Looks like exp? Try to get the hist from imnoise
[~, noise] = imnoise2(ones(npix, 1), 'exponential', 50);
hist2 = imhist(noise);

% WRONG
figure(2), 
subplot(1, 2, 1), bar(hist, 1), title('Histogram of ROI'),
subplot(1, 2, 2), bar(hist2, 1), title('Estimated PDF');

% With the diagonal wen with a higher N to make it less blurry without
% keeping noise
mid = spfilt(img, 'min', 2, 3);

K = imabsdiff(mid, ogImg);

figure(3),
subplot(1, 4, 1), imshow(img), title('Noisy Image')
subplot(1, 4, 2), imshow(mid), title('Min filter')
subplot(1, 4, 3), imshow(ogImg), title('Original')
subplot(1, 4, 4), imshow(K), title('Abs Diff (OG and Filtered)');