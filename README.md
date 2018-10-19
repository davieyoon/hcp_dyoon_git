# hcp

files and code for analyzing HCP 7T V1 V2 V3 data: ~/Dropbox/hcp7tret-cmf/dyoon_git

This is a copy of the DYOON_GIT (formerly EXPORT_DYOON_CODE) directory on the HCP dropbox. On the commandline: cd ~/Dropbox/hcp... or /Users/davie.yoon/Dropbox/hcp7tret-cmf

create new repository on github.com
git remote add origin https://github.com/davieyoon/hcp_dyoon_git.git -- type into terminal, sets origin alias -- if it's breaking try this: https://stackoverflow.com/questions/1221840/remote-origin-already-exists-on-git-push-to-a-new-repository
git remote rm origin
git push origin master : send stuff from my computer to the website
refresh github repository website - should see it all the files there in github repository
git remote -v : can push/pull from these listed repositories
if you need to pull from github website repository
ttp://swcarpentry.github.io/git-novice/ --> course website with all lessons

IMPORTANT COMMANDS AFTER INITIATION DURING ACTIVE CODING git diff: check for differences before any adding -- git diff --staged to check after git add git add file.ext / git commit -m "message" / git status / git log git add moves it to a "staged" area -- git commit moves it to the "head" version git add -p -- adding multiple files - will ask to review selected changes for multiple files -- can choose a subset for different commits that are logically different

GET CURRENT MASTER - STAY UPDATED Start in git repository directory on my computer git pull origin master

BE CITABLE Get a DOI for github repository so people can cite it using ZENODO

GO TO PREV VERSIONS VS HEAD VS MASTER git diff HEAD~4 mars.txt : check four commits ago for diffs with curr uncommitted change git diff 264380abbef5a51fd : copy and paste token from git log of version you wanted - can be partial token git checkout 264380abbef5a51fd file.txt : get a specific previous version of a file git checkout HEAD mars.txt : get the most recent committed version git checkout master -- go back and start fresh with the master version

davie.yoon@10-16-104-194:$ git config --global user.name "Davie Yoon" davie.yoon@10-16-104-194:$ git config --global user.email "davie.yoon@gmail.com" davie.yoon@10-16-104-194:~$ git config --global core.editor "nano" # or do sublime etc git config --global color.ui auto # pretty color settings git config --list : find out all the settings git config --h : get help on all the options

git init : starts a repository with a hidden .git directory -- ll (ls -al) to see it -- if you rm -r the .git directory, it will delete the initiated new repository

git status : check what's going on - frequent command like ls!!! -- let's you know what is in the repository that needs to be checked in, etc in RED -- good message is "nothing to commit, working tree clean"

git add file.ext + git status : should show that the file has been added to the repository in GREEN -- will only track changes in plain text files csv, txt, any programming scripts of any languages, things that will open in a text editor (not any MS offfice -- try by opening in a text editor, if it has wingdings, then it won't track changes)

CLEAR -- shell command to clear past history

git commit -m "message" : verb action description of half a sentence - e.g., started notes on x

git log: will say author, date, and commit message

git diff: davie.yoon@10-16-104-194:~/Desktop/planets$ git diff diff --git a/mars.txt b/mars.txt index 889bf1a..84037ef 100644 --- a/mars.txt +++ b/mars.txt @@ -1 +1,2 @@ -cold and dry but everything is my fave color +cold and dry but everything is my fave color +two moons may be a problem for wolfman (edited)
