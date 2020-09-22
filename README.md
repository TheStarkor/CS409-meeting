# outdoor-3d-pose

## SPIN demo
### Prerequisite
- nvidia GPU & appropriate driver
- [cuda](https://developer.nvidia.com/cuda-toolkit)
- [Docker](https://www.docker.com/)
- [Nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

### Run
```
$ docker pull chaneyk/spin
$ docker run -it --gpus all --rm -v ${PWD}:/home chaneyk/spin
// docker running!
$ git clone https://github.com/TheStarkor/outdoor-3d-pose.git
$ cd outdoor-3d-pose/demo && ./run_SPIN.sh
```

### Results
![image](https://user-images.githubusercontent.com/45455072/93908460-9ac84200-fd39-11ea-96a6-dcf6dab64d92.png)
![image](https://user-images.githubusercontent.com/45455072/93911855-ee3c8f00-fd3d-11ea-9ca9-e8bdff1abadd.png)
![image](https://user-images.githubusercontent.com/45455072/93911387-48892000-fd3d-11ea-996b-310c632f7f94.png)
![image](https://user-images.githubusercontent.com/45455072/93912340-95b9c180-fd3e-11ea-99b7-a7a919ade87d.png)