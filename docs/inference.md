# Inference / 推理

After Docker setup, download the published [GroundingJev weights](https://huggingface.co/xyzzzh/GroundingJev) to skip training:

完成 Docker 环境配置后，可下载已发布的 [GroundingJev 权重](https://huggingface.co/xyzzzh/GroundingJev)，跳过训练：

```bash
bash scripts/docker.sh --eval run --rm groundingjev \
  hf download xyzzzh/GroundingJev --local-dir /models/GroundingJev
```

After downloading or training, run:

下载或训练完成后，执行：

```bash
bash scripts/infer.sh \
  --image /workspace/datasets/RefCOCO/train2014/your_image.jpg \
  --expression 'the person wearing a red shirt'
```

Replace the filename and expression with your example. The command loads `models/GroundingJev`. The JSON field `bbox_xyxy` contains `[x1, y1, x2, y2]` in original-image pixels. Add `--output /outputs/prediction.json` to save the result.

替换图像文件名与目标描述即可使用。命令加载 `models/GroundingJev`，返回的 JSON 字段 `bbox_xyxy` 是原图像素坐标下的 `[x1, y1, x2, y2]`。添加 `--output /outputs/prediction.json` 可保存结果。
