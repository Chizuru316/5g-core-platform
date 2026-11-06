# Contributing

1. Fork and create a feature branch from `main`.
2. Keep PLMN/DNN values in `core/common/*.env`; do not hard-code them elsewhere.
3. Run `pre-commit run --all-files` and `make test` before opening a PR.
4. Never commit `.env`, private keys or large pcap files (use Git LFS for traces).
