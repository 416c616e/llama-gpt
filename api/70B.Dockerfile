# Define the image argument and provide a default value
ARG IMAGE=ghcr.io/abetlen/llama-cpp-python:latest

FROM ${IMAGE}

# Define the model file name and download url
ENV MODEL_FILE=llama-2-70b-chat.bin
ENV MODEL_DOWNLOAD_URL=https://huggingface.co/TheBloke/Llama-2-70B-Chat-GGML/resolve/main/llama-2-70b-chat.ggmlv3.q4_0.bin

# Download the model file
RUN apt-get update -y && \
    apt-get install --yes curl && \
    mkdir -p /models

WORKDIR /app

COPY . .

EXPOSE 8000

# Run the server start script
CMD ["/bin/sh", "/app/run.sh"]
