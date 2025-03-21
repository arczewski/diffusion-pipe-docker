FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04

WORKDIR /diffusion-pipe
RUN apt update -y && apt install -y python3 python3-pip python3-venv python3-dev gcc make vim
RUN git clone --recurse-submodules https://github.com/tdrussell/diffusion-pipe .
COPY . /diffusion-pipe/
ENV NCCL_P2P_DISABLE="1"
ENV NCCL_IB_DISABLE="1"
ENV NUM_GPUS=1
ENV CONFIG_PATH=""
ENTRYPOINT [ "/diffusion-pipe/docker/run.sh" ]
