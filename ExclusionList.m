% Exclusions list
% BY DY 2018/11/07
%
% Based on subjects_UniqueList.xls 

169040 % S7, Poor LH  
169343 % S17, Misaligned
239136 % S35, Contralateral colors
214019 % S55, Poor LH 
125525 % S62, extremely swirly distortions 
192439 % S65, Poor LH 
182436 % S107, squashed grid 
706040 % S120, ventral swirliness both hemispheres 
958976 % S134, very discrepant from atlas 
177645 % S149, very swirly both sides
169444 % S161, noisy, speckly, missing data 
572045 % 167, missing data did not review, poor 

excList = [169040 
169343 
239136 
214019 
125525 
192439 
182436 
706040 
958976 
177645 
169444 
572045]; 

matDir = fullfile(filesep, 'Users','davie','Dropbox','hcp7tret-cmf','hcp-lines','scripts'); 

save(fullfile(matDir,'excList.mat'),'excList'); 

