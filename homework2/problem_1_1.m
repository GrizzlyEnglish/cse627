ogImg = imread('DIP.png');
img = imread('DIP_n1.png');

% Get a section of the image interactively
[B, c, r] = roipoly(img);

% Look at the histogram to determine the noise
[hist, npix] = histroi(img, c, r);

% Looks like uniform? Try to get the hist from imnoise
[v, unv] = statmoments(hist,2);
[~, hist2] = imnoise2(ones(npix, 1), 'uniform', v(1), sqrt(v(2)));

figure(2), 
subplot(1, 2, 1), bar(hist, 1), 
subplot(1, 2, 2), bar(hist2, 1);

% According to slides gmean is good for uniform
% After trying the means seems midpoint is the best
mid = spfilt(img, 'midpoint', 3, 3);

figure(3),
subplot(1, 3, 1), imshow(img), title('Noisy Image')
subplot(1, 3, 2), imshow(mid), title('Midpoint')
subplot(1, 3, 3), imshow(ogImg), title('Original');