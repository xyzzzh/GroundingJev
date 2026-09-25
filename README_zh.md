<div align="center">

# GroundingJev

**基于 Qwen3.5-0.8B 的非自回归 Visual Grounding**

ModelScope ms-swift · EvalScope · Docker

[English](README.md) · [简体中文](README_zh.md) · [模型卡](MODEL_CARD.md) · [评估结果](evaluation/README.md)

</div>

![GroundingJev 架构](assets/architecture.svg)

## 项目介绍

GroundingJev 在 Qwen3.5-0.8B 多模态主干上，以连续边界框回归替代自回归坐标解码。轻量 MLP 回归头读取最后一个有效 token 的隐藏状态，通过单次前向输出归一化 `cxcywh` 坐标。

训练采用加权 L1 与 GIoU 损失，先适配回归头，再联合优化语言主干、视觉 merger 与回归头；视觉编码器的其余参数保持冻结。

训练使用 ModelScope **ms-swift**，评估使用 **EvalScope**，环境运行在 **Docker** 中。可选接入 **SwanLab** 记录训练进度。详见[架构说明](docs/architecture.md)。

## 演示

[在线演示](https://huggingface.co/spaces/xyzzzh/GroundingJev) · [模型权重](https://huggingface.co/xyzzzh/GroundingJev) · [本地推理](docs/inference.md)

## 评估结果

<!-- RESULTS:START -->
完整测试集结果。

RefCOCO 与 RefCOCO+ 按全部样本合并 testA、testB；RefCOCOg 使用 test。

### mIoU ↑ (%)

| 数据集 | Qwen3.5-0.8B | **GroundingJev** | 提升（百分点） |
| :--- | ---: | ---: | ---: |
| RefCOCO | 72.83 | **78.26** | +5.43 |
| RefCOCO+ | 64.84 | **73.18** | +8.33 |
| RefCOCOg | 71.52 | **74.97** | +3.45 |

### IoU@0.5 ↑ (%)

| 数据集 | Qwen3.5-0.8B | **GroundingJev** | 提升（百分点） |
| :--- | ---: | ---: | ---: |
| RefCOCO | 79.74 | **89.11** | +9.37 |
| RefCOCO+ | 70.10 | **82.82** | +12.72 |
| RefCOCOg | 77.96 | **85.46** | +7.50 |

### 推理性能

| 模型 | 延时 ↓ (ms) | 吞吐 ↑ (样本/s) | 加速比 ↑ |
| :--- | ---: | ---: | ---: |
| Qwen3.5-0.8B | 1588.53 | 0.630 | 1.00× |
| GroundingJev | **184.47** | **5.421** | **8.61×** |

**推理加速 8.61×，平均延时降低 88.39%。**

端到端推理耗时，不含模型加载与预热。

请求 batch：Qwen3.5-0.8B=1, GroundingJev=1
<!-- RESULTS:END -->

![质量与评估结果](assets/figures/evaluation-results.svg)

各测试划分的结果见[完整结果](evaluation/README.md)，评测设置见[评估说明](docs/evaluation.md)。

## 快速开始

安装 Docker Compose 和 NVIDIA Container Toolkit 后，在仓库根目录执行以下命令。

```bash
git clone https://github.com/xyzzzh/GroundingJev.git
cd GroundingJev
```

### 1. 准备数据与安装

下载并解压 [train2014.zip](https://huggingface.co/datasets/omlab/VLM-R1/blob/main/train2014.zip)。准备 RefCOCO 标注压缩包，并将 `.env` 中的 `REFCOCO_IMAGES_DIR` 设置为解压后的 `train2014` 目录。

```bash
cp .env.example .env
python scripts/prepare_data.py --archive /path/to/refcoco.zip --output data/refcoco
bash scripts/docker.sh build
bash scripts/docker.sh run --rm groundingjev python scripts/download_model.py
```

最后一条命令下载 Qwen3.5-0.8B 基础模型。训练文件名为 `refcoco_80k_train.jsonl`，评估文件名见[数据准备](docs/data.md)。

### 2. 训练

```bash
bash scripts/train.sh
```

参数位于 [configs/train/groundingjev.json](configs/train/groundingjev.json)。训练结果写入 `outputs/groundingjev`，完成后模型导出到 `models/GroundingJev`。如需 SwanLab，设置 `SWANLAB_API_KEY` 并添加 `--swanlab`。

### 3. 本地推理

如需直接使用已发布权重，可跳过训练并下载：

```bash
bash scripts/docker.sh --eval run --rm groundingjev \
  hf download xyzzzh/GroundingJev --local-dir /models/GroundingJev
```

执行推理：

```bash
bash scripts/infer.sh \
  --image /workspace/datasets/RefCOCO/train2014/your_image.jpg \
  --expression 'the person wearing a red shirt'
```

结果包含原图像素坐标下的预测框。

### 4. 评估

```bash
bash scripts/evaluate.sh groundingjev
bash scripts/evaluate.sh base
bash scripts/benchmark.sh
```

质量评估覆盖 RefCOCO、RefCOCO+ 和 RefCOCOg，性能测试报告延时与吞吐。详见[完整结果](evaluation/README.md)。

## 参与贡献

欢迎参与改进。开发与提交说明见 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 许可证与致谢

项目代码使用 [Apache 2.0](LICENSE) 许可证。模型权重与数据集保留各自的许可证。

GroundingJev 受 [TypeSafe Jev](https://typesafe.ai/blog/introducing-system-one-models-and-jev) 启发。感谢 [Qwen3.5](https://huggingface.co/Qwen/Qwen3.5-0.8B)、[ModelScope ms-swift](https://github.com/modelscope/ms-swift)、[EvalScope](https://github.com/modelscope/evalscope)、[SwanLab](https://github.com/SwanHubX/SwanLab) 以及 [COCO](https://cocodataset.org/)/[RefCOCO](https://github.com/lichengunc/refer) 作者。
