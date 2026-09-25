# Final evaluation evidence

This directory contains a neutral, derived index and the final published results for Qwen3.5-0.8B and GroundingJev. It does not rewrite raw model predictions or scores.

Original evidence is stored outside the repository at `../GroundingJev-evaluation-evidence`. `index.json` records the archive-manifest SHA-256 digest and the archive-relative path, byte count and SHA-256 digest of every referenced source. The external manifest additionally preserves the original source locations.

The archive contains ten full quality evaluations: five dataset splits for each model, with 61,938 predictions and 61,938 reviews in total. It also preserves the final performance benchmark, resume-prefix provenance, training metadata and exported model identity. Model weights are not duplicated here.

本目录保存两个模型最终评估结果的中性派生索引。原始预测、评分、报告和配置按原始字节保存在上述仓库外目录；可按索引中的 SHA-256 核验。路径与模型显示名称仅属于索引元数据，未改变原始实验记录。
