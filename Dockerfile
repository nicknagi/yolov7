FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

# # Install libGL development libraries (assuming Debian-based system)
RUN apt-get update && apt-get install -y libgl1-mesa-glx pip python3 libglib2.0-0 libsm6 libxrender1 libxext6

RUN apt-get install -y git wget

# Install dependencies from requirements.txt
COPY requirements.txt .
RUN --mount=type=cache,target=/root/.cache pip install -r requirements.txt

# Working directory
WORKDIR /app

# Copy your application code
COPY . .

# Fetch the model weights
RUN wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7.pt

# Define the inference script entrypoint
ENTRYPOINT ["python3", "detect.py"]
