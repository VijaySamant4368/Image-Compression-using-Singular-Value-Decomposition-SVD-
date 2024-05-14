imageName = 'BigBlock.png';
image = imread(imageName);

N = 4;

[error, compressedimage] = compressImage(image, N);
[rLayer, gLayer, bLayer]=splitImage(image);
[rComLayer, gComLayer, bComLayer]=splitImage(compressedimage);

% Save the compressed image
imwrite(uint8(compressedimage), 'compressed_image.png');
% imwrite(uint8(rLayer), 'red_image.png');
% imwrite(uint8(gLayer), 'green_image.png');
% imwrite(uint8(bLayer), 'blue_image.png');
imwrite(uint8(rComLayer), 'red_image_compressed.png');
imwrite(uint8(gComLayer), 'green_image_compressed.png');

imwrite(uint8(bComLayer), 'blue_image_compressed.png');


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

image

error