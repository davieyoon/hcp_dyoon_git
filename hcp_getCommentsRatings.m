% hcp_getCommentsRatings.m 
%
% 2018-09-26 DY
%
% Script that loops through all the manually defined retinotopies and saves
% out the comment fields. Also the 1/2/3 ratings of quality. Writes it out
% to a file readable by Excel. 

%% Set variables, file names, paths
hcpDir = '/home/stone-ext4/kendrick/HCP7TFIXED/manualdefinition/'; 
sListFile = 'subjectsUnique.mat'; 
resultFile = 'results.mat'; 
saveDir = fullfile('/home/stone-ext4/generic/Dropbox/hcp7tret-cmf/export_dyoon_code');
saveName = 'allComments.csv';
rateName='allRatings.csv'; 

%% Get list of subjects for this user
[~,userName]=unix('whoami'); 
userName=userName(1:end-1);
userName=getpref('ROIGUI','user',userName); 
subjectLoader=load(fullfile(hcpDir,userName,sListFile));
subjects=subjectLoader.subjectsUnique; 

%% Loop through all subjects
for ii = 1:length(subjects);
    thisSubject = load(fullfile(hcpDir,userName,subjects{ii},resultFile));
    
    %Check subject is completed, go to next subject if not
    if(thisSubject.completed ~= 1)
        continue
    end
    
    tmp = thisSubject.currComment; 
    
    allLeft(ii) = thisSubject.ratingsLeft;  
    allRight(ii) = thisSubject.ratingsRight;  
    
    % Check for weird formatting - sometimes comment is formatted as MxN
    % character array. Reformat so it can be written out to text file. 
    if min(size(tmp))>1
        fixit=cellstr(tmp); % now it's a Nx1 cell array 
        fixit=strjoin(fixit'); 
        allComments{ii}=fixit; clear fixit 
    else
        allComments{ii}=tmp; 
    end
    
    %ssubIDs{ii}=thisSubject.
    
    
end

%% Write the text files 
% Investigate WRITETABLE and CELL2TABLE FUNCTION <-- JW suggests 
saveFile = fopen(fullfile(saveDir,saveName),'w');
fprintf(saveFile, '%s\n',allComments{:});
fclose(saveFile);

% Write the numbers separately for left and right hemisphere ratings 
T=[allLeft' allRight'];
writetable(array2table(T), fullfile(saveDir,rateName)); 

