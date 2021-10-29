#!/bin/sh
# Fetch and track all branches of a remote repository

git branch -r | grep -v '\->' | while read remote; 
do 
	#echo "git branch --track ${remote#origin/} $remote"
	git branch --track "${remote#origin/}" "$remote" 
done
