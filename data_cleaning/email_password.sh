#!/bin/bash

# If the dump is in email:password format already
set -eou pipefail # error handling

# Gives us username, domain, password
awk -F '[@:]' '{print $1,"\t",$2,"\t",$3}' "$1"  >> cleaned_master_list 
