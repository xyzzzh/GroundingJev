#!/usr/bin/env bash
set -euo pipefail
task_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
task_model="${1:-groundingjev}"
if [[ "$task_model" != groundingjev && "$task_model" != base ]]; then
  printf '%s\n' 'Usage: bash scripts/evaluate.sh groundingjev|base [evaluation arguments]' >&2
  exit 2
fi
if (($#)); then shift; fi
exec bash "$task_root/scripts/docker.sh" --eval run --rm groundingjev \
  python scripts/evaluate_all.py "$task_model" "$@"
