# Building with podman/docker
podman build . -t repo_name/image_name:version
docker build . -t repo_name/image_name:version

You can use anything for name. For example arczewski/diffusion-pipe:0.1

# Running with podman
On launch it will install all dependencies. To prevent it from installing it over and over again when running multiple time use:
-v venv:/diffusion-pipe/venv:z to mount venv on your local storage and cache its content.

## Running
Lets say you are currently in folder called AI.
Create folder training_data and put your dataset folder and config.yaml in this folder.
Then you can run:
podman run --device nvidia.com/gpu=all -e NUM_GPUS=1 -v training_data:/some_path_inside_container:z -e CONFIG_PATH /some_path_inside_container/config.yaml arczewski/diffusion-pipe:0.1

When you use -v it will share this folder with container so if you would look under /some_path_inside_container you would see content of your training_data folder.
Then you need to pass path to config.yaml.
Alternatively you could pass your whole AI folder like this:
podman run --device nvidia.com/gpu=all -e NUM_GPUS=1 -v .:/some_path_inside_container:z -e CONFIG_PATH /some_path_inside_container/training_data/config.yaml arczewski/diffusion-pipe:0.1
