function croppedImage=hcp_cropImage(I)
%
% tested by DY on 2018/09/22
%
% code taken from matlab answers: https://www.mathworks.com/matlabcentral/answers/320589-how-to-automatically-crop-empty-space-with-known-color-around-an-image-object-like-trim-in-ima
% modified to restore color info (first you have to do rgb2gray to make
% roicolor function work. 

grayI = rgb2gray(I);
colorOfInterest = 255;
roi = ~roicolor(grayI, colorOfInterest, colorOfInterest);
idx = find(roi==1);
[y, x] = ind2sub(size(grayI), idx);
x1 =  round(min(x));
y1 =  round(min(y));
x2 =  round(max(x));
y2 =  round(max(y));
croppedImage = I(y1:y2, x1:x2,:);

%% code to check how everything looks 
%
%figure;
%subplot(1,2,1);
%imshow(I);
%subplot(1,2,2);
%imshow(croppedImage);
return 
