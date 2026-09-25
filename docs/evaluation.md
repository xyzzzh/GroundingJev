# Evaluation / 评估

After preparing the data and model, run:

准备好数据与模型后，执行：

```bash
bash scripts/evaluate.sh groundingjev
bash scripts/evaluate.sh base
bash scripts/benchmark.sh
```

Quality evaluation covers RefCOCO testA/testB, RefCOCO+ testA/testB, and RefCOCOg test. Reports are saved under `outputs/evaluation`; performance results are saved under `outputs/benchmark`.

质量评估覆盖 RefCOCO testA/testB、RefCOCO+ testA/testB 与 RefCOCOg test。质量报告保存在 `outputs/evaluation`，性能结果保存在 `outputs/benchmark`。

- **mIoU**: Mean box intersection over union / 平均框交并比。
- **IoU@0.5**: Fraction of expressions with IoU ≥ 0.5 / IoU 不低于 0.5 的描述比例。
- **Prediction latency / 预测延时**: Time to predict one expression / 单条描述的预测耗时。
- **Throughput / 吞吐**: Expressions processed per second / 每秒处理的描述数。

Invalid predictions remain in the quality denominator. Quality evaluation uses batches; the latency benchmark uses one request at a time. Evaluation-workflow timing includes loading and scoring and is labeled separately from prediction latency.

无效预测保留在质量指标分母中。质量评估采用批量预测，延时测试逐条测量。评估流程耗时包含加载与计分，与预测延时分别标注。

Complete results and their data are in [evaluation/README.md](../evaluation/README.md) and [results.json](../evaluation/results.json).

完整结果与数据见 [evaluation/README.md](../evaluation/README.md) 和 [results.json](../evaluation/results.json)。
