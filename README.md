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

### Results
![image](https://user-images.githubusercontent.com/45455072/93908460-9ac84200-fd39-11ea-96a6-dcf6dab64d92.png)
