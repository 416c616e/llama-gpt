# Define the image argument and provide a default value
ARG IMAGE=nvidia/cuda:12.2.0-devel-ubuntu22.04

FROM ${IMAGE}

# Define the model file name and download url
ENV MODEL_FILE=llama-2-7b-chat.bin
ENV MODEL_DOWNLOAD_URL=https://huggingface.co/TheBloke/Nous-Hermes-Llama-2-7B-GGML/resolve/main/nous-hermes-llama-2-7b.ggmlv3.q4_0.bin
ENV DEBIAN_FRONTEND=noninteractive
ENV GPU_OFFLOAD_LAYERS=30
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip git cmake curl && mkdir -p /models
RUN CMAKE_ARGS="-DLLAMA_CUBLAS=on" FORCE_CMAKE=1 pip install llama-cpp-python
RUN pip install numpy diskcache uvicorn fastapi sse-starlette pydantic-settings

WORKDIR /app

COPY . .

EXPOSE 8000

# Run the server start script
CMD ["/bin/sh", "/app/run.sh"]
