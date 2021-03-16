#!/bin/bash
# TSV generator for data files that have entries in the format username:password

find . -name "*.txt" | parallel -q grep --text '@[[:print:]]\+\.[[:print:]]\+:' | awk -F '[@:]' '{print $1,"\t",$2,"\t",$3}'