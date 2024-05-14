function [error, compressedImage] = compressImage(image, N)
    compressedImage = zeros(size(image));
    for i = 1:3
        [U, S, V] = svd(double(image(:,:,i)));
        S(N+1:end, :) = 0;      %For all columns beyond N
        S(:, N+1:end) = 0;      %For all rows beyond N
        compressedImage(:,:,i) = U * S * V';
    end
    originalImage=double((image));
    ComMatrix=double((compressedImage));



ErrorMatrix = originalImage - ComMatrix;
ErrorMatrixAbs = abs(ErrorMatrix);
m=size(ErrorMatrix, 1);
n=size(ErrorMatrix, 2);
diff = 0;
threshold = 25.6;
for i = 1:m
    for j = 1:n
        delta=max(ErrorMatrixAbs(i, j, 1),ErrorMatrixAbs(i, j, 2) );
        delta=max(delta,ErrorMatrixAbs(i, j, 3));
        if delta> threshold
            diff = diff + 1;
        else
            diff= diff+delta/255;
        end
    end
end

error1 = diff * 100 / (m*n);


% Step 1: Compute Mean Squared Error (MSE) for each channel
mse_r = sum(sum((originalImage(:,:,1) - ComMatrix(:,:,1)).^2)) / numel(originalImage(:,:,1));
mse_g = sum(sum((originalImage(:,:,2) - ComMatrix(:,:,2)).^2)) / numel(originalImage(:,:,2));
mse_b = sum(sum((originalImage(:,:,3) - ComMatrix(:,:,3)).^2)) / numel(originalImage(:,:,3));

% Step 2: Calculate Max value for each channel
maxPixelValue_r = max(originalImage(:,:,1), [], 'all');
maxPixelValue_g = max(originalImage(:,:,2), [], 'all');
maxPixelValue_b = max(originalImage(:,:,3), [], 'all');

% Step 4: Convert error to percentage scale for each channel
compressionErrorPercentage_r = (mse_r / (maxPixelValue_r^2)) * 100;
compressionErrorPercentage_g = (mse_g / (maxPixelValue_g^2)) * 100;
compressionErrorPercentage_b = (mse_b / (maxPixelValue_b^2)) * 100;

nonBlack=3;

if isnan(compressionErrorPercentage_r)
    compressionErrorPercentage_r = 0;
    nonBlack=nonBlack-1;
end

if isnan(compressionErrorPercentage_g)
    compressionErrorPercentage_g = 0;
    nonBlack=nonBlack-1;
end

if isnan(compressionErrorPercentage_b)
    compressionErrorPercentage_b = 0;
    nonBlack=nonBlack-1;
end

errors=[compressionErrorPercentage_r compressionErrorPercentage_g compressionErrorPercentage_b];
error=[error1 (sum(errors))/nonBlack];

end
