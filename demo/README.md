---
title: GroundingJev
emoji: 🎯
colorFrom: blue
colorTo: gray
sdk: gradio
sdk_version: 5.50.0
python_version: 3.12.12
app_file: app.py
pinned: false
license: apache-2.0
models:
  - xyzzzh/GroundingJev
short_description: Locate an object using an image and a referring expression.
---

# GroundingJev demo

Upload an image and describe one object in English. GroundingJev returns the image with a predicted bounding box.

Model: [xyzzzh/GroundingJev](https://huggingface.co/xyzzzh/GroundingJev).

To deploy, upload the contents of this directory to a Gradio Space and select **ZeroGPU** hardware. The app downloads the pinned model revision automatically. No access token or training dependencies are needed.

Free personal accounts with a verified email and an account older than 30 days can host up to two ZeroGPU Spaces. Requests share the service's GPU queue and daily usage quota. See the [Hugging Face ZeroGPU documentation](https://huggingface.co/docs/hub/spaces-zerogpu).
