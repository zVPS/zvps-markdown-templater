#!/bin/bash

INPUT_FILE=$1;
OUTPUT_FILE_NAME="${INPUT_FILE/"source/"/}";
OUTPUT_FILE="export/$OUTPUT_FILE_NAME.html";

while inotifywait -e close_write "$INPUT_FILE"; do 
    RESULT=$(bundle exec markup $INPUT_FILE -o $OUTPUT_FILE -F);
    ./templater.sh "$OUTPUT_FILE";
done

exit 0;
