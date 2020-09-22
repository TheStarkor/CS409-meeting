# run SPIN

## References
- [SPIN](https://github.com/nkolot/SPIN)
- [SMPLify](http://smplify.is.tue.mpg.de/)
- [smplx](https://github.com/vchoutas/smplx)

## Process
1. docker 실행 후 requirements 설치
    - pytorch 버전 업데이트
2. SMPL 모델 다운로드
    - SMPL 업데이트로 인해 파일명 변경
3. `clean_ch.py` 실행
    - python2 가상환경 만든 후 환경설정 해서 실행
4. demo 실행

## Errors
October 2020 이후에 에러가 발생하는 것 같으므로 수정 해야 할 것 같음
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
[SMPLify](http://smplify.is.tue.mpg.de/) 회원가입 후 모델 다운로드 이후 `.pkl` 파일명 변경 (smplx 구조에 맞춰 변경 하였음)
```
$ cd /opt
$ wget http://smplify.is.tue.mpg.de/main/download1
$ mv download1 download.zip
$ unzip download.zip
$ cd smplify_public/code/models/
$ cp basicModel_neutral_lbs_10_207_0_v1.0.0.pkl SMPL_NEUTRAL.pkl
```

###  `clean_ch.py` 실행
[smplx](https://github.com/vchoutas/smplx) 의 tool 사용하여 진행
```
$ cd /opt
$ git clone https://github.com/vchoutas/smplx.git
$ virtualenv --python=/usr/bin/python2.7 new
$ source ./new/bin/activate
$ pip install chumpy tqdm
$ python smplx/tools/clean_ch.py --input-models smplify_public/code/models/*.pkl --output-folder SPIN/data/smpl
```

### demo 실행 및 결과 저장
```
$ deactivate
$ cd SPIN
$ python3 demo.py --checkpoint=data/model_checkpoint.pt --img=examples/im1010.jpg --openpose=examples/im1010_openpose.json
$ cp -r examples/*.png /home/image
```

## sh 파일로 정리
[run_SPIN.sh](https://github.com/TheStarkor/outdoor-3d-pose/blob/master/demo/run_SPIN.sh)
```
$ docker pull chaneyk/spin
$ docker run -it --gpus all --rm -v ${PWD}:/home chaneyk/spin
// docker running!
$ git clone https://github.com/TheStarkor/outdoor-3d-pose.git
$ cd outdoor-3d-pose
$ ./run_SPIN.sh
```

### Results
![image](https://user-images.githubusercontent.com/45455072/93907329-280a9700-fd38-11ea-8b30-60266d9ce59f.png)
![image](https://user-images.githubusercontent.com/45455072/93908392-84ba8180-fd39-11ea-9fc1-e1fd88c86fea.png)
![image](https://user-images.githubusercontent.com/45455072/93908460-9ac84200-fd39-11ea-96a6-dcf6dab64d92.png)
