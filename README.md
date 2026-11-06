# 5g-core-platform

Lab project: a cloud-native 5G Standalone (SA) Core on a Service-Based Architecture (SBA) with CUPS,
based on 3GPP TS 23.501 / TS 23.502. Supports **free5GC** and **Open5GS**, tested with the
**StormSIM** and **UERANSIM** simulated gNB + UE.

Goal: run Initial Registration and PDU Session Establishment end to end, forward N6 traffic to the
Internet, and capture/analyze NGAP, NAS-5GS, PFCP and SBI (HTTP/2) traffic.

## Repository layout

| Path | Purpose |
| --- | --- |
| `core/` | 5GC network functions (free5GC, Open5GS) and shared PLMN/DNN settings |
| `ran/` | Simulated gNB + UE (StormSIM, UERANSIM) |
| `network/` | Docker networks, NAT for N6, IP plan |
| `k8s/` | Optional Kubernetes manifests |
| `scripts/` | Host setup, start/stop, subscriber provisioning, capture |
| `tests/` | End-to-end and integration checks |
| `tools/` | Wireshark filters/profiles and pcap analysis scripts |
| `captures/` | Captured pcap/pcapng traces |
| `docs/` | Technical notes and lab guides |

## Quick start

```bash
cp .env.example .env
make setup      # scripts/setup-env.sh
make nat        # network/setup-nat.sh
make core       # scripts/start-core.sh
make subscriber # scripts/add-subscriber.sh
make capture    # scripts/capture-traffic.sh
make ran        # start gNB then UE
make test       # run tests
```

## Interfaces

| Interface | Protocol | Endpoints | Port / Subnet |
| --- | --- | --- | --- |
| SBI | HTTP/2 + JSON | NF <-> NF (via NRF) | 10.100.200.0/24 |
| N1 | NAS-5GS (over N2) | UE <-> AMF | via gNB |
| N2 | NGAP / SCTP | gNB <-> AMF | 38412 |
| N3 | GTP-U / UDP | gNB <-> UPF | 2152 |
| N4 | PFCP / UDP | SMF <-> UPF | 8805 |
| N6 | IPv4/IPv6 | UPF <-> DN | NAT to Internet |

## Defaults

MCC 999, MNC 70, TAC 000001, S-NSSAI SST 1 / SD 010203, DNN `internet`, UE pool 10.45.0.0/16.
See `core/common/plmn.env` and `core/common/dnn.env`.

## License

See [LICENSE](LICENSE).
