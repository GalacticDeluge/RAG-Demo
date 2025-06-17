#!/bin/bash

# Exit on error
set -e

echo "Starting post-create script..."

# Python Backend Setup
echo "Setting up Python backend..."
pip install --upgrade pip
pip install -r backend/requirements.txt

# React Frontend Setup
echo "Setting up React frontend..."
# The node_modules can get large, so we place it outside the workspace folder
# to avoid it being synced back to the local machine if you use VS Code remote.
npm_cache_folder="/workspaces/.npm-cache"
mkdir -p "$npm_cache_folder"
npm config set cache "$npm_cache_folder"

# Install create-vite to scaffold the project, then create the app
npm install -g create-vite
cd frontend
npm create vite@latest . -- --template react-ts

# Install frontend dependencies
npm install

echo "Post-create script finished successfully!"