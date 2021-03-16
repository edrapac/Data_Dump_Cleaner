#!/bin/bash
# For resetting commit history of a repo. Must be ran within the repository itself.

if [ -d .git ]
then
	# Grab the origin before deleting
	origin=$(cat .git/config | grep url | awk -F '= ' '{print $2}')

	# Remove the git dir  
	rm -rf .git

	# recreate the repos from the current content only
	git init
	git add .
	read -p "Type a commit message here: " msg
	git commit -m "$msg" 

	# push to the github remote repos ensuring you overwrite history
	git remote add origin "$origin"
	git push -u --force origin master
else
	echo "No .git directory found, are you sure you are running this in a git repository?"
fi