set -eou pipefail # error handling
awk -F "@" '{print $1}' "$1" >> cleaned_master_list 
