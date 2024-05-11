function [error, compressedImage] = compressImage(image, N)
    compressedImage = zeros(size(image));
    for i = 1:3
        [U, S, V] = svd(double(image(:,:,i)));
        S(N+1:end, :) = 0;      %For all columns beyond N
        S(:, N+1:end) = 0;      %For all rows beyond N
        compressedImage(:,:,i) = U * S * V';
        N1=size(S);
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









    
% Assuming originalImage and compressedImage are your original and compressed image matrices

% Step 1: Compute Mean Squared Error (MSE)
mse = sum(sum((originalImage - ComMatrix).^2)) / numel(originalImage);

% Step 2: Calculate Peak Signal-to-Noise Ratio (PSNR)
maxPixelValue = max(originalImage(:));

% Step 3: Convert PSNR to percentage scale (assuming higher PSNR implies lower error)
compressionErrorPercentage = (mse / (maxPixelValue^2)) * 100;

% Display the compression error percentage
% disp(['Compression Error Percentage: ', num2str(compressionErrorPercentage), '%']);

errors=compressionErrorPercentage;
error=[error1 (sum(errors))];


    % % Calculate compression error
    % errornum = sum(abs(compressedImage(:) - double(image(:))));
    % errordenom = numel(image) * 3 * 256;
    % error = 100 * errornum / errordenom;
    % size(image);
    % "Original singular values: "; N1;
    % "New singular values: "; N;
end
