.PHONY: setup nat core subscriber capture ran test stop clean

setup:
	bash scripts/setup-env.sh

nat:
	sudo bash network/setup-nat.sh

core:
	bash scripts/start-core.sh

subscriber:
	bash scripts/add-subscriber.sh

capture:
	sudo bash scripts/capture-traffic.sh

ran:
	docker compose -f ran/stormsim/docker-compose.yaml up -d

test:
	bash tests/integration/test_nrf_registration.sh
	bash tests/integration/test_pfcp_association.sh
	bash tests/e2e/test_registration.sh
	bash tests/e2e/test_pdu_session.sh

stop:
	bash scripts/stop-core.sh

clean:
	bash scripts/clean.sh
