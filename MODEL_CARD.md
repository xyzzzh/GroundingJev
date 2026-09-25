---
language:
  - en
tags:
  - visual-grounding
  - referring-expression-comprehension
  - qwen3.5
  - modelscope
base_model: Qwen/Qwen3.5-0.8B
license: apache-2.0
---

# GroundingJev model card / 模型卡

GroundingJev adapts Qwen3.5-0.8B for non-autoregressive visual grounding. A continuous regression head maps the last valid token's multimodal representation to normalized `(cx, cy, width, height)`, replacing autoregressive coordinate decoding.

GroundingJev 基于 Qwen3.5-0.8B 实现非自回归 Visual Grounding，利用连续坐标回归头，将最后一个有效 token 的多模态表征映射为归一化的 `(cx, cy, width, height)`，替代自回归坐标解码。

- **Base model / 基础模型**: Qwen3.5-0.8B
- **Training / 训练**: ModelScope ms-swift
- **Evaluation / 评估**: ModelScope EvalScope
- **Training annotations / 训练标注**: `refcoco_80k_train.jsonl`
- **Objective / 训练目标**: `5 × L1 + 2 × (1 − GIoU)`
- **Output / 输出**: Original-image `xyxy` box / 原图 `xyxy` 边界框
- **Model weights / 模型权重**: [xyzzzh/GroundingJev](https://huggingface.co/xyzzzh/GroundingJev)

## Usage / 使用

Follow the [quick start](README.md#quick-start) for installation, data preparation, training, inference, and evaluation.

安装、数据准备、训练、推理与评估见[快速开始](README_zh.md#快速开始)。

After Docker setup, download the published weights to skip training:

完成 Docker 环境配置后，可下载已发布权重，跳过训练：

```bash
bash scripts/docker.sh --eval run --rm groundingjev \
  hf download xyzzzh/GroundingJev --local-dir /models/GroundingJev
```

Then follow the [inference guide](docs/inference.md). 下载后按[推理说明](docs/inference.md)使用。

## Evaluation / 评估

<!-- RELEASE_STATUS:START -->
Full results: [evaluation record](evaluation/README.md).

Inference performance results are available.
<!-- RELEASE_STATUS:END -->

## Scope / 适用范围

Evaluation covers English referring expressions on RefCOCO, RefCOCO+, and RefCOCOg. The output is a single bounding box; segmentation, multi-object detection, and transfer to other languages or domains have not been evaluated.

评测覆盖 RefCOCO、RefCOCO+ 和 RefCOCOg 的英文 referring expressions。模型输出单个边界框，尚未评测分割、多目标检测及跨语言、跨领域迁移。

## License and acknowledgments / 许可证与致谢

Project code uses [Apache 2.0](LICENSE). Model weights and datasets retain their own licenses. We thank Qwen3.5, ModelScope ms-swift/EvalScope, SwanLab, TypeSafe Jev, and the COCO/RefCOCO authors.

项目代码采用 [Apache 2.0](LICENSE) 许可证，模型权重和数据集遵循各自许可证。感谢 Qwen3.5、ModelScope ms-swift/EvalScope、SwanLab、TypeSafe Jev 及 COCO/RefCOCO 作者。
