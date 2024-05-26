FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

# # Install libGL development libraries (assuming Debian-based system)
RUN apt-get update && apt-get install -y libgl1-mesa-glx pip python3 libglib2.0-0 libsm6 libxrender1 libxext6

# Install dependencies from requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Working directory
WORKDIR /app

# Copy your application code
COPY . .

# Define the inference script entrypoint
ENTRYPOINT ["python3", "detect.py"]
