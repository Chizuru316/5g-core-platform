# Setup

Execution order:

1. `scripts/setup-env.sh`
2. `network/setup-nat.sh`
3. `scripts/start-core.sh` (NRF and MongoDB healthy first)
4. `scripts/add-subscriber.sh`
5. `scripts/capture-traffic.sh`
6. Start gNB, wait for the N2 SCTP association, then the UE
7. Verify: ping 8.8.8.8 from the UE TUN interface

Test subscriber: `imsi-999700000000001`, K `465B5CE8B199B49FAA5F0A2EE238A6BC`,
OPc `E8ED289DEBA952E6B6710CE70EAC1F64` (test values only).
