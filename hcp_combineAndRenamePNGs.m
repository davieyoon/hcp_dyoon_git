% hcp_combineAndRenamePNGs
%
% 2018/09/22 DY 
%
% Will create a new PNG image that is a combination of the polar angle and
% eccentricity PNGs created by exportPNG.m - the file will be named with
% the real 6 digit subject ID so it can be compared with Noah's PNGs. 
%
% Also calls the function CROPIMAGE, .m file created by DY from code on
% matlab answers website. 

desktopPath = '/Users/davie.yoon/Desktop/'; 
dyDir = 'export_dyoon';
addpath(fullfile(desktopPath,dyDir)); 
newDir = 'export_dyoon_combined'; 
subList = 'subjectsUnique.mat';

tmp = load(fullfile(desktopPath,dyDir,subList)); 
subs=tmp.subjectsUnique; % load in the appropriate field 

cd(fullfile(desktopPath,dyDir)); 

for ii=1:length(subs)
    cv_filename = sprintf('dyoonCV%s.png',num2str(ii));
    pa_filename = sprintf('dyoonPA%s.png',num2str(ii)); 
    ec_filename = sprintf('dyoonEC%s.png',num2str(ii));
    cvIm = imread(cv_filename); 
    cvImCrop = hcp_cropImage(cvIm); 
    paIm = imread(pa_filename); 
    paImCrop = hcp_cropImage(paIm); 
    ecIm = imread(ec_filename); 
    ecImCrop = hcp_cropImage(ecIm); 
    newIm = vertcat(cvImCrop,paImCrop,ecImCrop);
    saveName = sprintf('%s_dyoon.png',subs{ii}); 
    imwrite(newIm, fullfile(desktopPath,newDir,saveName)); 
end

%% Check which subject files are missing 
% for ii=1:181
%     cv_filename = sprintf('dyoonCV%s.png',num2str(ii));
%     if exist(cv_filename,'file');
%        continue
%     else
%         fprintf('%s does not exist\n',cv_filename);
%     end
% end

