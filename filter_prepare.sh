#!/bin/bash

wget https://easylist.to/easylist/easylist.txt
grep -F "##" easylist.txt > onscreen_filters.txt

echo '"domain","filter"' > onscreen_filters.table.txt
sed 's/##/","/g; s/^/"/; s/$/"/' onscreen_filters.txt >> onscreen_filters.table.txt

echo -e ".mode csv\n.import onscreen_filters.table.txt onscreen_filters\n\n" | sqlite3 main.db
