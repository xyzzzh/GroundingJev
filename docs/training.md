# Training / 训练

Complete [setup](setup.md) and [data preparation](data.md), then run:

完成[环境配置](setup.md)与[数据准备](data.md)后，执行：

```bash
bash scripts/train.sh
```

Training uses `refcoco_80k_train.jsonl`. Parameters are in [configs/train/groundingjev.json](../configs/train/groundingjev.json). Progress and checkpoints are saved under `outputs/groundingjev`; the completed model is exported to `models/GroundingJev`.

训练使用 `refcoco_80k_train.jsonl`，参数位于 [configs/train/groundingjev.json](../configs/train/groundingjev.json)。进度与检查点保存在 `outputs/groundingjev`，完成后的模型导出到 `models/GroundingJev`。

For SwanLab logging, set `SWANLAB_API_KEY` and run:

如需 SwanLab 日志，设置 `SWANLAB_API_KEY` 后执行：

```bash
bash scripts/train.sh --swanlab
```

See [inference](inference.md) and [evaluation](evaluation.md) for the next steps.

后续操作见[推理](inference.md)与[评估](evaluation.md)。
