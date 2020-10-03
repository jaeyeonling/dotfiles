#! /bin/bash

echo "Update global git config"
git lfs install

echo "Update system git config"
git lfs install --system
