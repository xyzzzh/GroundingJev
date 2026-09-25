FROM nvidia/cuda:12.8.1-base-ubuntu24.04@sha256:133c78a0575303be34164d0b90137a042172bdf60696af01a3c424ab402d86e2

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    TOKENIZERS_PARALLELISM=false \
    VIRTUAL_ENV=/opt/groundingjev-venv
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 python3-venv git ca-certificates \
       libgl1 libglib2.0-0 libsndfile1 libgomp1 \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m venv "${VIRTUAL_ENV}" \
    && python -m pip install --no-cache-dir uv==0.10.0

COPY docker/requirements.lock /opt/groundingjev/requirements.lock
RUN --mount=type=cache,target=/root/.cache/uv \
    uv pip install --python /opt/groundingjev-venv/bin/python \
       --require-hashes -r /opt/groundingjev/requirements.lock \
    && python -m pip check \
    && python -m pip freeze > /opt/groundingjev/environment.freeze.txt

COPY scripts/check_environment.py /opt/groundingjev/check_environment.py
RUN python /opt/groundingjev/check_environment.py --imports-only

WORKDIR /workspace/GroundingJev
CMD ["bash"]
