#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/strgz/rest/eb77138b6efdccfc6fa5bcfced23c7ba/cosmos/base/tendermint/v1beta1/blocks/latest"

OUTPUT_DIR="logs"

stargaze_data=$(curl -s -H "Content-Type: application/json" -X GET "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    : > "$OUTPUT_DIR/stargaze.txt"
    echo "$stargaze_data" >> "$OUTPUT_DIR/stargaze.txt"
    
    echo "stargaze data fetched and saved to $OUTPUT_DIR/stargaze.txt."
else
    echo "Failed to fetch stargaze data."
fi
