# outdoor-3d-pose

## Getting Started
### SPIN demo
Prerequisite
- nvidia GPU & appropriate driver
- [cuda](https://developer.nvidia.com/cuda-toolkit)
- [Docker](https://www.docker.com/)
- [Nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

```
$ docker pull chaneyk/spin
$ docker run -it --gpus all --rm -v ${PWD}:/home chaneyk/spin
// docker running!
$ git clone https://github.com/TheStarkor/outdoor-3d-pose.git
$ cd outdoor-3d-pose/demo && ./run_SPIN.sh
```