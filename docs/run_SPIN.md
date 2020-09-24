# run SPIN

## Process
1. docker 실행 후 requirements 설치([SPIN](https://github.com/nkolot/SPIN) 에서 제공)
    - pytorch 는 버전 문제로 에러 발생하여 새로 업데이트
    - numpy, torchgeometry 도 업데이트 해 주어야 할 것 같음
2. SMPL 모델 다운로드
    - 라이센스 문제로 [SMPLify](http://smplify.is.tue.mpg.de/) 사이트에서 받아야 함
    - smlpx README의 architecutre 와 파일명이 달라서 파일명을 동일하게 해주었음
3. `clean_ch.py` 실행
    - python2 코드라 해당 가상환경 만든 후 실행
4. demo 실행
5. 임의의 데이터셋으로 테스트

## Errors
- October 2020 이후에 에러가 발생한다고 하니 유의해야 할 것 같음

![image](https://user-images.githubusercontent.com/45455072/93907716-aa935680-fd38-11ea-80b7-3973018d005f.png)
![image](https://user-images.githubusercontent.com/45455072/93907777-bda62680-fd38-11ea-9f2b-3019bc139dea.png)

## Prerequisite
- nvidia GPU & appropriate driver
- [cuda](https://developer.nvidia.com/cuda-toolkit)
- [Docker](https://www.docker.com/)
- [Nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

### host
![image](https://user-images.githubusercontent.com/45455072/93907431-47a1bf80-fd38-11ea-8872-c91bbce46cb4.png)
### container(nvidia-docker --gpus all option)
![image](https://user-images.githubusercontent.com/45455072/93907518-62743400-fd38-11ea-868f-eaff53631951.png)

## Run

### docker 실행 후 requirements 설치
docker 의 경우 일단 --rm 옵션을 주었는데 필요하면 제거하면 될 것 같고 tensorboard와 torch 업데이트 해주었음.
```
$ docker pull chaneyk/spin
$ docker run -it --gpus all --rm -v ${PWD}:/home chaneyk/spin
$ cd /opt
$ git clone https://github.com/nkolot/SPIN.git
$ cd SPIN
$ pip install -U pip
$ pip install -r requirements.txt
$ ./fetch_data.sh
$ pip install --upgrade tensorboard && pip install --upgrade torch
```

### SMPL 모델 다운로드
[SMPLify](http://smplify.is.tue.mpg.de/) 회원가입 후 모델 다운로드 이후 `.pkl` 파일명 변경 (smplx에 설명된 [구조](https://github.com/vchoutas/smplx#model-loading)(SMPL_NUTRAL.pkl)에 맞춰 변경 하였음)
```
$ cd /opt
$ wget http://smplify.is.tue.mpg.de/main/download1
$ mv download1 download.zip
$ unzip download.zip
$ cd smplify_public/code/models/
$ cp basicModel_neutral_lbs_10_207_0_v1.0.0.pkl SMPL_NEUTRAL.pkl
```

###  `clean_ch.py` 실행
python2 가상환경을 만든 후 [smplx](https://github.com/vchoutas/smplx)의 tool 사용하여 진행
```
$ cd /opt
$ git clone https://github.com/vchoutas/smplx.git
$ virtualenv --python=/usr/bin/python2.7 new
$ source ./new/bin/activate
$ pip install chumpy tqdm
$ python smplx/tools/clean_ch.py --input-models smplify_public/code/models/*.pkl --output-folder SPIN/data/smpl
```

### demo 실행 및 결과 저장
python2 가상환경 deactivate 이후 준비한 환경에서 진행하고 docker 에서 공유된 디렉토리로 파일 옮겼음(/home)
```
$ deactivate
$ cd SPIN
$ python3 demo.py --checkpoint=data/model_checkpoint.pt --img=examples/im1010.jpg --openpose=examples/im1010_openpose.json
$ cp -r examples/*.png /home
```

## sh 파일로 정리
[run_SPIN.sh](https://github.com/TheStarkor/outdoor-3d-pose/blob/master/demo/run_SPIN.sh) 실행 결과 아래 이미지와 같이 정상적으로 작동하는 것을 확인하였음.
```
$ docker pull chaneyk/spin
$ docker run -it --gpus all --rm -v ${PWD}:/home chaneyk/spin
// docker running!
$ git clone https://github.com/TheStarkor/CS409-meeting.git
$ cd CS409-meeting
$ ./run_SPIN.sh
```

### Results
![image](https://user-images.githubusercontent.com/45455072/93907329-280a9700-fd38-11ea-8b30-60266d9ce59f.png)
![image](https://user-images.githubusercontent.com/45455072/93908392-84ba8180-fd39-11ea-9fc1-e1fd88c86fea.png)
![image](https://user-images.githubusercontent.com/45455072/93908460-9ac84200-fd39-11ea-96a6-dcf6dab64d92.png)

## Own data set

- in SPIN directory
```
$ cp /home/<image> examples/
$ python3 demo.py --checkpoint=data/model_checkpoint.pt --img=examples/<image>
$ cp -r examples/*.png /home
```

### Baseball
![image](https://user-images.githubusercontent.com/45455072/93911359-41621200-fd3d-11ea-99de-b97fb0f46e34.png)
![image](https://user-images.githubusercontent.com/45455072/93911387-48892000-fd3d-11ea-996b-310c632f7f94.png)

### Golf
- 사람 인식을 못해서 실패한 것으로 예상
![image](https://user-images.githubusercontent.com/45455072/93911886-f8f72400-fd3d-11ea-8239-e7e5e8f336c3.png)
![image](https://user-images.githubusercontent.com/45455072/93911855-ee3c8f00-fd3d-11ea-9ca9-e8bdff1abadd.png)

### common
![image](https://user-images.githubusercontent.com/45455072/93912340-95b9c180-fd3e-11ea-99b7-a7a919ade87d.png)

## References
- [SPIN](https://github.com/nkolot/SPIN)
- [SMPLify](http://smplify.is.tue.mpg.de/)
- [smplx](https://github.com/vchoutas/smplx)