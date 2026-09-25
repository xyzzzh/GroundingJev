# Evaluation results

Full test-set results.

### mIoU ↑ (%)

| Split | Samples | Qwen3.5-0.8B | **GroundingJev** | Gain (pp) |
| :--- | ---: | ---: | ---: | ---: |
| RefCOCO testA | 5,657 | 76.48 | **81.31** | +4.83 |
| RefCOCO testB | 5,095 | 68.78 | **74.88** | +6.10 |
| RefCOCO+ testA | 5,726 | 70.16 | **78.06** | +7.91 |
| RefCOCO+ testB | 4,889 | 58.62 | **67.46** | +8.83 |
| RefCOCOg test | 9,602 | 71.52 | **74.97** | +3.45 |

### IoU@0.5 ↑ (%)

| Split | Samples | Qwen3.5-0.8B | **GroundingJev** | Gain (pp) |
| :--- | ---: | ---: | ---: | ---: |
| RefCOCO testA | 5,657 | 84.27 | **92.12** | +7.85 |
| RefCOCO testB | 5,095 | 74.72 | **85.77** | +11.05 |
| RefCOCO+ testA | 5,726 | 76.53 | **88.35** | +11.82 |
| RefCOCO+ testB | 4,889 | 62.57 | **76.33** | +13.77 |
| RefCOCOg test | 9,602 | 77.96 | **85.46** | +7.50 |

### Inference performance

| Model | Latency ↓ (ms) | Throughput ↑ (samples/s) | Speedup ↑ |
| :--- | ---: | ---: | ---: |
| Qwen3.5-0.8B | 1588.53 | 0.630 | 1.00× |
| GroundingJev | **184.47** | **5.421** | **8.61×** |

**8.61× inference speedup, with 88.39% lower mean latency.**

End-to-end prediction time, excluding model loading and warmup.

Requested batch: Qwen3.5-0.8B=1, GroundingJev=1

[Results / 结果数据](results.json) · [Reproduce / 复现](../docs/evaluation.md)

## 中文

完整测试集结果。

### mIoU ↑ (%)

| 测试划分 | 样本数 | Qwen3.5-0.8B | **GroundingJev** | 提升（百分点） |
| :--- | ---: | ---: | ---: | ---: |
| RefCOCO testA | 5,657 | 76.48 | **81.31** | +4.83 |
| RefCOCO testB | 5,095 | 68.78 | **74.88** | +6.10 |
| RefCOCO+ testA | 5,726 | 70.16 | **78.06** | +7.91 |
| RefCOCO+ testB | 4,889 | 58.62 | **67.46** | +8.83 |
| RefCOCOg test | 9,602 | 71.52 | **74.97** | +3.45 |

### IoU@0.5 ↑ (%)

| 测试划分 | 样本数 | Qwen3.5-0.8B | **GroundingJev** | 提升（百分点） |
| :--- | ---: | ---: | ---: | ---: |
| RefCOCO testA | 5,657 | 84.27 | **92.12** | +7.85 |
| RefCOCO testB | 5,095 | 74.72 | **85.77** | +11.05 |
| RefCOCO+ testA | 5,726 | 76.53 | **88.35** | +11.82 |
| RefCOCO+ testB | 4,889 | 62.57 | **76.33** | +13.77 |
| RefCOCOg test | 9,602 | 77.96 | **85.46** | +7.50 |

### 推理性能

| 模型 | 延时 ↓ (ms) | 吞吐 ↑ (样本/s) | 加速比 ↑ |
| :--- | ---: | ---: | ---: |
| Qwen3.5-0.8B | 1588.53 | 0.630 | 1.00× |
| GroundingJev | **184.47** | **5.421** | **8.61×** |

**推理加速 8.61×，平均延时降低 88.39%。**

端到端推理耗时，不含模型加载与预热。

请求 batch：Qwen3.5-0.8B=1, GroundingJev=1
