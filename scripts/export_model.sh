#!/usr/bin/env bash
set -euo pipefail
task_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
exec bash "$task_root/scripts/docker.sh" run --rm groundingjev \
  python scripts/export_model.py --output /models/GroundingJev "$@"
