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
%
% Choose whether to save out as the original 1-181 subids or 6 digit ids by
% commenting out the appropriate file saving command at the end. 

dropboxPath = '/home/stone-ext4/generic/Dropbox/hcp7tret-cmf';
codeDir = 'export_dyoon_code'; 
pngDir = 'export_dyoon'; 
newDir = 'export_dyoon_combined'; 
subList = 'subjectsUnique.mat';

tmp = load(fullfile(dropboxPath,codeDir,subList)); 
subs=tmp.subjectsUnique; % load in the appropriate field 

addpath(fullfile(dropboxPath,codeDir)); 
cd(fullfile(dropboxPath,pngDir)); 

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
    % write out a copy with the real 6 digit subject id numbers
    %saveName = sprintf('%s_dyoon.png',subs{ii});
    % write out a copy with the original 1-181 subject id numbers
    saveName = sprintf('dyoon_%d.png',ii); 
    imwrite(newIm, fullfile(dropboxPath,newDir,saveName)); 
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

