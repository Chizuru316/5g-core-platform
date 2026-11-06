#!/usr/bin/env bash
# tcpdump on N2 (sctp 38412), N3 (udp 2152), N4 (udp 8805) and SBI.
set -euo pipefail
OUT="$(dirname "$0")/../captures/capture_$(date +%Y%m%d_%H%M%S).pcapng"
# TODO: tcpdump -i any -w "$OUT" 'sctp or udp port 2152 or udp port 8805 or net 10.100.200.0/24'
echo "Output: $OUT"
