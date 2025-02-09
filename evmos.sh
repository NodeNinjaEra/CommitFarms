#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/evmos/rest/eb77138b6efdccfc6fa5bcfced23c7ba/cosmos/base/tendermint/v1beta1/blocks/latest"

OUTPUT_DIR="logs"

evmos_data=$(curl -s -H "Content-type: application/json" -X GET "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    : > "$OUTPUT_DIR/evmos.txt"
    echo "$evmos_data" >> "$OUTPUT_DIR/evmos.txt"
    
    echo "evmos data fetched and saved to $OUTPUT_DIR/evmos.txt."
else
    echo "Failed to fetch evmos data."
fi
