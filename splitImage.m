function [RedLayer, GreenLayer, BlueLayer] = splitImage(image)

RedLayer=zeros(size(image));
GreenLayer=zeros(size(image));
BlueLayer=zeros(size(image));

RedLayer(:,:,1)=image(:,:,1);
GreenLayer(:,:,2)=image(:,:,2);
BlueLayer(:,:,3)=image(:,:,3);