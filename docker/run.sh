#!/bin/bash
python3 -m venv venv
source venv/bin/activate
pip3 install packaging torch torchvision wheel
pip3 install -r requirements.txt
deepspeed --num_gpus=${NUM_GPUS} train.py --deepspeed --config ${CONFIG_PATH}