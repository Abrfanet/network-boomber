#!/bin/bash


RANDOM_WORD=`grep '^.\{9\}$' /usr/share/dict/words | shuf -n1`
RANDOM_WORD2=`grep '^.\{6\}$' /usr/share/dict/words | shuf -n1`
RANDOM_WORD3=`grep '^.\{12\}$' /usr/share/dict/words | shuf -n1`
RANDOM_WORD4=`shuf -n 2 persian-words.txt | tr -d '\n\t '`
RANDOM_WORD5=`shuf -n 4 persian-words.txt | tr -d '\n\t '`
# List of URLs to request
URLS=(
    "https://www.google.com/search?q=$RANDOM_WORD"
    "https://www.google.com/search?q=$RANDOM_WORD2"
    "https://www.google.com/search?q=$RANDOM_WORD3"
    "https://search.yahoo.com/search?p=$RANDOM_WORD"
    "https://search.yahoo.com/search?p=$RANDOM_WORD3"
    "https://search.yahoo.com/search?p=$RANDOM_WORD3+$RANDOM_WORD"
    "https://yandex.com/search/?text=$RANDOM_WORD4&lr=11495"
    "https://yandex.com/search/?text=$RANDOM_WORD5&lr=131495"

    # Add more URLs as needed
)

# Function to perform a curl request
perform_curl() {
    local url=$1
    local output_file=$2

    echo "Requesting: $url"
    curl -s -o "$output_file" "$url"
    if [ $? -eq 0 ]; then
        echo "Success: $url"
    else
        echo "Failed: $url"
    fi
}

# Create a temporary directory for output files
OUTPUT_DIR=$(mktemp -d)
echo "Output directory: $OUTPUT_DIR"

# Perform concurrent curl requests
for ((i=0; i<${#URLS[@]}; i++)); do
    output_file="$OUTPUT_DIR/output_$i.txt"
    perform_curl "${URLS[$i]}" "$output_file" &
done

# Wait for all background processes to complete
wait

echo "All requests completed."

# Clean up
rm -rf "$OUTPUT_DIR"
echo "Output directory cleaned up."
