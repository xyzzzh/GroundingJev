#!/usr/bin/env bash
set -euo pipefail
task_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
task_stamp="$(date -u +%Y%m%dT%H%M%S)-$$"
exec bash "$task_root/scripts/docker.sh" --eval run --rm groundingjev \
  python -m groundingjev.benchmark \
  --base-model /models/Qwen3.5-0.8B --checkpoint /models/GroundingJev \
  --jsonl /workspace/datasets/RefCOCO/annotations/refcoco_testA_eval.jsonl \
  --output "/outputs/benchmark/$task_stamp" --device cuda:0 \
  --samples 256 --warmup 10 --seed 42 "$@"
