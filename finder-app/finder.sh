#!/bin/bash

# Kontrol: İki parametre verilmeli: 1) filesdir, 2) searchstr
if [ $# -lt 2 ]
then
    echo "Error: Missing parameters"
    exit 1
fi

filesdir=$1
searchstr=$2

# Kontrol: filesdir gerçekten bir dizin mi?
if [ ! -d "$filesdir" ]
then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

# 1) Dizindeki dosya sayısını bul (tüm alt dizinler dahil)
num_files=$(find "$filesdir" -type f | wc -l)

# 2) searchstr içeren satır sayısını bul
num_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_lines"
