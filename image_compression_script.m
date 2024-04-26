imageName = 'color.png';
image = imread(imageName);

N = 10;

[error, compressedimage] = compressImage(image, N);
[rLayer, gLayer, bLayer]=splitImage(image);
[rComLayer, gComLayer, bComLayer]=splitImage(compressedimage);

% Save the compressed image
imwrite(uint8(compressedimage), 'compressed_image.jpg');
imwrite(uint8(rLayer), 'red_image.jpg');
imwrite(uint8(gLayer), 'green_image.jpg');
imwrite(uint8(bLayer), 'blue_image.jpg');

% Display original image
subplot(3, 3, 1);
imshow(uint8(image), 'InitialMagnification', 'fit');
title('Original Image');

% Display compressed image
subplot(3, 3, 3);
imshow(uint8(compressedimage), 'InitialMagnification', 'fit');
title('Compressed Image')

% mixedImage=rLayer+gLayer+bLayer;
% subplot(2, 3, 3);
% imshow(uint8(mixedImage), 'InitialMagnification', 'fit');
% title('Mixed Image')

subplot(3,3,4);
imshow(uint8(rLayer), 'InitialMagnification', 'fit');
title('Red Image')

subplot(3,3,5);
imshow(uint8(gLayer), 'InitialMagnification', 'fit');
title('Green Image')

subplot(3,3,6);
imshow(uint8(bLayer), 'InitialMagnification', 'fit');
title('Blue Image')

subplot(3,3,7);
imshow(uint8(rComLayer), 'InitialMagnification', 'fit');
title('Compressed Red Image')

subplot(3,3,8);
imshow(uint8(gComLayer), 'InitialMagnification', 'fit');
title('Compressed Green Image')

subplot(3,3,9);
imshow(uint8(bComLayer), 'InitialMagnification', 'fit');
title('Compressed Blue Image')