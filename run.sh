for i in {1..10000}; do ncat -v -p 37540 -w10 -4u 255.255.255.255 37541 < breed.txt;done;
