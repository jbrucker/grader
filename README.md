## Github Utilities

This repository contains some utilities for collecting student work from Github.

| File               | Description              |
|--------------------|--------------------------|
| bin/clonegit       | Clone a named repo from each student's Github acct. |
| bin/cloneclassroom | Clone an assignment from Github Classroom. |
| students.csv       | File of student names and their Github ids. |

Ths scripts use the `git` command on your system (rather than the Github API),
so `git` must be on your command shell PATH.

### `students.csv`

This file contains student names and Github accounts in CSV format:

```
# Firstname, github_id, Fullname, other
Alan,turing,Alan Turing,turing@mit.edu
James,jgosling,James Gosline,gosling@sun.com
Martin,mfowler,Martin Fowler,fowler@thoughtworks.com
```
blank lines and lines between with # are ignored. All other lines must
contain at least 3 fields.

* Field 1: student name or other identifier
* Field 2: student Github ID
* Field 3: verbose student name or identifier, used in printed messages

## `clonegit` 

A Python script that clones or pulls updates for a named repo from the
students' own accounts. It assumes `students.csv` is in the current directory.

Usage: `python3 bin/clonegit assignment1`

will try to clone all "assignment1" repos for every account in students.csv
and put the clones in a directory for each student (Field 1 of CSV file):
```
Alan/assignment1
James/assignment1
Martin/assignment1
```
directories and subdirectories are created as needed.

Other Usage: `python3 bin/clonegit assignment1 James Martin`

Get assignment1 for only the specifiied student(s), e.g. James and Martin.

My Usage: `clonegit assignment1  [student1 ...]`

I add `bin` to my shell path and make the Python script executable (Linux mode 755 and line 1 contains "#!/usr/bin/python3") so I can execute the script directly.


### `cloneclassroom`

A Python script to clone a Github Classroom assignment.  This script requires some editing before you use it:

- set `CLASSROOM="github-classroom-name"`
- set `BASE_URL="git@github.com:"` or `"https://github.com/"` depending on whether you use SSH or HTTPS authentication.
- there are other variables you can set in the script. 

**pre-authenticate** to Github: enter some git command that causes Github to prompt you for authentication before your run this script, so you are authenticated to a user that has permission to access the Github Classroom private repos. This is because the script suppresses the authentication prompt to avoid endless prompting when attempting to clone a non-existing student assignment.

Usage: `python3 bin/cloneclassroom assignment2`

clones all student submissions for an assignment where the base repo name is "assignment1".  As with `clonegit`, it puts the student repos in a subdirectory having the student name(s):
```
Alan/assignment2
James/assignment2
Martin/assignment2
```

Other Usage: `python3 bin/cloneclassroom assignment2 Alan [...]`

clone `assignment2` for only the specified student(s), e.g. "Alan".

Help Message: `python3 bin/cloneclassroom`  (no arguments)


### [Github Classroom Assistant][classroom-assistant] - Another Way to Download from Github Classroom

[Github Classroom Assistant][classroom-assistant] is a GUI application for managing assignments in Github Classroom.  Assistant is a desktop app built on the Electron framework.  Uses tons of Javascript packages.

