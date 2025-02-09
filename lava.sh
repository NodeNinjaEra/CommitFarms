#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/lav1/rest/eb77138b6efdccfc6fa5bcfced23c7ba/lava/base/tendermint/v1beta1/blocks/latest"

OUTPUT_DIR="logs"

lava_data=$(curl -s -H "Content-Type: application/json" -X GET "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    : > "$OUTPUT_DIR/lava.txt"
    echo "$lava_data" > "$OUTPUT_DIR/lava.txt"
    
    echo "lava data fetched and saved to $OUTPUT_DIR/lava.txt."
else
    echo "Failed to fetch lava data."
fi
