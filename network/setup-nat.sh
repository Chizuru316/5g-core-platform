#!/usr/bin/env bash
# Enable IP forwarding and MASQUERADE for the UE pool (N6 egress).
set -euo pipefail
source "$(dirname "$0")/../core/common/dnn.env"
EGRESS_IFACE="${EGRESS_IFACE:-eth0}"
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -C POSTROUTING -s "$UE_POOL" -o "$EGRESS_IFACE" -j MASQUERADE 2>/dev/null \
  || iptables -t nat -A POSTROUTING -s "$UE_POOL" -o "$EGRESS_IFACE" -j MASQUERADE
