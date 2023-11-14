#!/bin/bash

# sigint handling in case script gets more complicated in the future
handle_signal() {
	echo "SIGINT recieved, script interrupted."
	exit 0
}

trap handle_signal SIGINT

# change this to your user account name
user="account-name-of-user-that-stores-this-tex-project"

# gets current date, generates folder name on current day and paths
# to appropriate month and year (and generates them if they do not exist

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

# construct folder path
template_file="/Users/$user/Documents/journal/2023/11/06/note.tex"
folder_path="/Users/$user/Documents/journal/$year/$month/$day"

# -p handles making folder in path that don't yet exist
mkdir -p "$folder_path"
cp "$template_file" "$folder_path/note.tex"

# changes ownership from root to user and changes r/w permissions
chown -R $user "$folder_path"
chmod -R u+w "$folder_path"
