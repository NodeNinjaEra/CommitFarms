#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/solana/rpc-http/eb77138b6efdccfc6fa5bcfced23c7ba"

OUTPUT_DIR="logs"

solana_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"getBlockHeight","params":[],"id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    : > "$OUTPUT_DIR/solana.txt"
    echo "$solana_data" >> "$OUTPUT_DIR/solana.txt"
    
    echo "solana data fetched and saved to $OUTPUT_DIR/solana.txt."
else
    echo "Failed to fetch solana data."
fi
