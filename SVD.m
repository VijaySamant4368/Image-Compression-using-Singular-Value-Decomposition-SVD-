image=imread("BlockColor.png");
[Ur,Sr,Vr]= svd(double(image(:,:,1)))
[Ug,Sg,Vg]= svd(double(image(:,:,2)))
[Ub,Sb,Vb]= svd(double(image(:,:,3)))