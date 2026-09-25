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

GroundingJev predicts a bounding box from an image and an English referring expression. It uses the Qwen3.5-0.8B multimodal backbone and a regression head, producing coordinates in one forward pass.

GroundingJev 根据图像与英文目标描述预测边界框，使用 Qwen3.5-0.8B 多模态主干与回归头，一次前向即可输出坐标。

- **Base model / 基础模型**: Qwen3.5-0.8B
- **Training / 训练**: ModelScope ms-swift
- **Evaluation / 评估**: ModelScope EvalScope
- **Training annotations / 训练标注**: `refcoco_80k_train.jsonl`
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

The model supports referring-expression grounding and returns a box for the described object. It does not produce segmentation masks or multiple-object detections. Results on other languages and domains require separate evaluation.

模型用于根据描述定位目标，返回对应边界框，不提供分割掩码或多目标检测。其他语言和领域的效果需另行评估。

## License and acknowledgments / 许可证与致谢

Project code uses [Apache 2.0](LICENSE). Model weights and datasets retain their own licenses. We thank Qwen3.5, ModelScope ms-swift/EvalScope, SwanLab, TypeSafe Jev, and the COCO/RefCOCO authors.

项目代码采用 [Apache 2.0](LICENSE) 许可证，模型权重和数据集遵循各自许可证。感谢 Qwen3.5、ModelScope ms-swift/EvalScope、SwanLab、TypeSafe Jev 及 COCO/RefCOCO 作者。
