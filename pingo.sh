#!/bin/bash

# List of URLs to request
URLS=(
    "1.1.1.1"
    "8.8.8.8"
    "9.9.9.9"
    "149.112.112.112"
    "178.22.122.100"
    "185.51.200.2"
    "185.143.232.0-254"
    "8.35.192.0-254"
    # Add more URLs as needed
)

# Function to perform a curl request
perform_ping() {
    local url=$1

    echo "Requesting: $url"
    #!/bin/bash

    # ping -c500 "$url" 2>&1 | tail -3 &

    nmap -sP "$url" 2>&1 | tail -3 &

    if [ $? -eq 0 ]; then
        echo "Success: $url"
    else
        echo "Failed: $url"
    fi
}



# Perform concurrent curl requests
for ((i=0; i<${#URLS[@]}; i++)); do
    perform_ping "${URLS[$i]}" &
done

# Wait for all background processes to complete
wait

echo "All requests completed."


