#!/bin/bash

# Used to test

set -eou pipefail # error handling

for i in "$(pwd)"/*.txt; do
	echo "Now examining: $i"
	head -n 10 "$i"
    echo "\n"
    read -p "Is the file in the format you want? " yn
    
    case $yn in
        [Yy]* ) echo "Moving on to next file...";;
        [Nn]* ) echo "File $i in incorrect format, appending .bak extension to file. It will NOT be processed \n"; mv "$i" "$i".bak;; # set all undesirable files to .bak extension to be ignored by helper script
        * ) echo "Please answer yes or no.";;
    esac
done
read -p "Are the files in email:password format " yn

case $yn in
	[Yy]* ) find . -name "*.txt" | parallel -I% ./email_password.sh % ;;
	[Nn]* ) find . -name "*.txt" | parallel -I% ./helper.sh % ;;
	* ) echo "Please answer yes or no.";;

esac
