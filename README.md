# outdoor-3d-pose

## Documents
- [WEEK3](https://github.com/TheStarkor/CS409-meeting/tree/master/docs/week3)
    - SPIN paper review, SPIN demo
- [WEEK4](https://github.com/TheStarkor/CS409-meeting/tree/master/docs/week4)

## SPIN demo
[More Information](https://github.com/TheStarkor/outdoor-3d-pose/blob/master/docs/run_SPIN.md)
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
$ git clone https://github.com/TheStarkor/CS409-meeting.git
$ cd outdoor-3d-pose/demo && ./run_SPIN.sh
```

### Results
![image](https://user-images.githubusercontent.com/45455072/93908460-9ac84200-fd39-11ea-96a6-dcf6dab64d92.png)
![image](https://user-images.githubusercontent.com/45455072/93911387-48892000-fd3d-11ea-996b-310c632f7f94.png)
