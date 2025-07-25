FROM python:3.10-slim

# Install basic system packages
RUN apt-get update && apt-get install -y \
    ffmpeg \
    tmux \
    git \
    curl \
    unzip \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy everything into container
COPY . .

# Give full permissions to all files/folders
RUN chmod -R 777 /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port for the FastAPI web server
EXPOSE 7860

# Make start script executable
RUN chmod +x start.sh

# Start the bot and web server
CMD ["./start.sh"]
