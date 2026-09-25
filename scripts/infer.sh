#!/usr/bin/env bash
set -euo pipefail
task_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
exec bash "$task_root/scripts/docker.sh" --eval run --rm groundingjev \
  python -m groundingjev.predict --checkpoint /models/GroundingJev --device cuda:0 "$@"
