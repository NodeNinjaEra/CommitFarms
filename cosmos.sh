#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/cosmoshub/rest/eb77138b6efdccfc6fa5bcfced23c7ba/cosmos/base/tendermint/v1beta1/blocks/latest"

OUTPUT_DIR="logs"

cosmos_data=$(curl -s -H "Content-Type: application/json" -X GET "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    : > "$OUTPUT_DIR/cosmos.txt"
    echo "$cosmos_data" > "$OUTPUT_DIR/cosmos.txt"
    
    echo "cosmos data fetched and saved to $OUTPUT_DIR/cosmos.txt."
else
    echo "Failed to fetch cosmos data."
fi
