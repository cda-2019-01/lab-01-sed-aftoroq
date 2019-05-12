sed -e 's|\([0-9][0-9]\)/\([0-9][0-9]\)/\([0-9][0-9]\)|20\3-\2-\1|' data.csv > data_2.csv
sed 's/N/\\N/g;s/;;/;\\N;/g' data_2.csv > data_3.csv
sed 's/;[[:space:]]/; /g' < data_3.csv | sed 's/; /;\\N/g' > data_4.csv
sed -E 's/([[:lower:]])/\U\1/g' data_4.csv > data_5.csv
sed 's/,/./g' < data_5.csv | sed 's/;/,/g'  > data_6.csv
sed 's/\([0-9][0-9][0-9]\),\([0-9]\)/\1.\2/' data_6.csv > solucion.csv
sed -i '/\\N/d' solucion.csv
rm data_*
cat solucion.csv
