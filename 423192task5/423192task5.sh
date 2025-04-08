awk '$2 == "ERROR" {print $1, $0}' log_file.txt
awk 'BEGIN {math_sum = 0; science_sum = 0; english_sum = 0; count = 0}
     NR > 1 {
         math_sum += $2;
         science_sum += $3;
         english_sum += $4;
         count++;
     }
     END {
         print "Average Math:", math_sum / count;
         print "Average Science:", science_sum / count;
         print "Average English:", english_sum / count;
     }' file.csv
awk '{ip_count[$1]++} END {for (ip in ip_count) print ip, ip_count[ip]}' server_log.txt
sed 's/\([^ ]*\) \(.*\) \([^ ]*\)/\3 \2 \1/' file.txt

