imageName = 'DarkRed.png';
image = imread(imageName);
image;

N=2;
[error, compressedimage] = compressImage(image, N);

compressedimage;
imwrite(uint8(compressedimage), ['compressed_image.png' ...
    '']);
newImage=imread('compressed_image.png');
newImage;

[rLayer, gLayer, bLayer]=splitImage(image);
imwrite(uint8(rLayer), 'red_block.png');
imwrite(uint8(gLayer), 'green_block.png');
imwrite(uint8(bLayer), 'blue_block.png');
rLayer(:,:,1);
gLayer(:,:,2);
bLayer(:,:,3);
image;

max(size(image, 1), size(image,2) )


[rComLayer, gComLayer, bComLayer]=splitImage(compressedimage);

% Save the compressed image
% vpa(compressedimage);
% compressedimage;
% [U1, S1, V1] = svd(double(image(:,:,1)))
% [U1, S1, V1] = svd(double(compressedimage(:,:,1)))
% 
% [U2, S2, V2] = svd(double(image(:,:,2)))
% [U2, S2, V2] = svd(double(compressedimage(:,:,2)))
% 
% [U3, S3, V3] = svd(double(image(:,:,3)))
% [U3, S3, V3] = svd(double(compressedimage(:,:,3)))




