#!/bin/bash

# install conda
mkdir -p miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda3/miniconda.sh
bash miniconda3/miniconda.sh -b -u -p miniconda3
rm -rf miniconda3/miniconda.sh

# create env
conda create -n lwm python=3.10
miniconda3/bin/conda init bash
conda init fish
cd /workspace/LWM
conda activate lwm
pip install -U "jax[cuda12_pip]==0.4.23" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
pip install -r requirements.txt
apt-get install cuda-toolkit-11-8

# download models
git lfs install
git clone https://huggingface.co/LargeWorldModel/LWM-Chat-32K-Jax

# add jupyter kernel
pip3 install jupyter_contrib_nbextensions
python3 -m ipykernel install --user --name=lwm

#    configure git user
git config --global credential.helper store
git config --global user.email "yenka@spicyai.tech"
git config --global user.name "yenkа"

fish