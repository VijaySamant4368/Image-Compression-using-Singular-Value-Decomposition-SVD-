function [error, compressedImage] = compressImage(image, N)
    compressedImage = zeros(size(image));
    for i = 1:3
        [U, S, V] = svd(double(image(:,:,i)));
        S(N+1:end, :) = 0;      %For all columns beyond N
        S(:, N+1:end) = 0;      %For all rows beyond N
        compressedImage(:,:,i) = U * S * V';
        N1=size(S);
    end
    
    
    % Calculate compression error
    errornum = sum(abs(compressedImage(:) - double(image(:))));
    errordenom = numel(image) * 3 * 256;
    error = 100 * errornum / errordenom;
    size(image);
    "Original singular values: "; N1;
    "New singular values: "; N;
end
