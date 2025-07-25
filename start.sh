#!/bin/bash

echo "🔄 Running update.py"
python3 update.py

echo "🚀 Starting Aeon-MLTB bot in tmux"
tmux new-session -d -s aeonbot 'python3 -u -m bot'

echo "🌐 Starting FastAPI server (web/wserver.py) on port 7860"
uvicorn web.wserver:app --host 0.0.0.0 --port 7860

echo "🔒 Keeping container alive with tail..."
# Keeps the Docker container alive
tail -f /dev/null