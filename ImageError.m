function [error] = ImageError(OriginalMatrix, NewMatrix)

ErrorMatrix = OriginalMatrix - NewMatrix;
ErrorMatrixAbs = abs(ErrorMatrix);

m=size(ErrorMatrix, 1);
n=size(ErrorMatrix, 2);
minusThreshold = 50;
negativeMinusThreshold = -20;
threshold = 25;
diff = 0;

for i = 1:m
    for j = 1:n
        if ErrorMatrixAbs(i, j, 1) > threshold || ErrorMatrixAbs(i, j, 2) > threshold || ErrorMatrixAbs(i, j, 3) > threshold
            diff = diff + 1;
        else
            deltaRminusG = NewMatrix(i, j, 1) - NewMatrix(i, j, 2) - OriginalMatrix(i, j, 1) + OriginalMatrix(i, j, 2);
            deltaGminusB = NewMatrix(i, j, 2) - NewMatrix(i, j, 3) - OriginalMatrix(i, j, 2) + OriginalMatrix(i, j, 3);
            deltaBminusR = NewMatrix(i, j, 3) - NewMatrix(i, j, 1) - OriginalMatrix(i, j, 3) + OriginalMatrix(i, j, 1);
            if negativeMinusThreshold > deltaRminusG || deltaRminusG > minusThreshold || negativeMinusThreshold > deltaGminusB || deltaGminusB > minusThreshold || negativeMinusThreshold > deltaBminusR || deltaBminusR > minusThreshold
                diff = diff + 0.5;
                deltaBminusR;
                deltaGminusB;
                deltaRminusG;
            end
        end
    end
end

error=diff*100/(m*n);
