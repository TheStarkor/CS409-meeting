# run SPIN

## References
- [SPIN](https://github.com/nkolot/SPIN)
- [SMPLify](http://smplify.is.tue.mpg.de/)
- [smplx](https://github.com/vchoutas/smplx)

## Start
1. docker 실행 후 requirements 설치
    - pytorch 버전 업데이트
2. SMPL 모델 다운로드
    - SMPL 업데이트로 인해 파일명 변경
3. `clean_ch.py` 실행
    - python2 가상환경 만든 후 환경설정 해서 실행
4. demo 실행

### Prerequisite
- nvidia GPU & appropriate driver
- [cuda](https://developer.nvidia.com/cuda-toolkit)
- [Docker](https://www.docker.com/)
- [Nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

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
```
$ docker pull chaneyk/spin
$ docker run -it --gpus all --rm -v ${PWD}:/home chaneyk/spin
// docker running!
$ git clone https://github.com/TheStarkor/outdoor-3d-pose.git
$ cd outdoor-3d-pose
$ ./run_SPIN.sh
```

### `run_SPIN.sh`
```
cd /opt
git clone https://github.com/nkolot/SPIN.git
cd SPIN
pip install -U pip
pip install -r requirements.txt
./fetch_data.sh
pip install --upgrade tensorboard && pip install --upgrade torch
cd /opt
wget http://smplify.is.tue.mpg.de/main/download1
mv download1 download.zip
unzip download.zip
cd smplify_public/code/models/
cp basicModel_neutral_lbs_10_207_0_v1.0.0.pkl SMPL_NEUTRAL.pkl
cd /opt
git clone https://github.com/vchoutas/smplx.git
virtualenv --python=/usr/bin/python2.7 new
source ./new/bin/activate
pip install chumpy tqdm
python smplx/tools/clean_ch.py --input-models smplify_public/code/models/*.pkl --output-folder SPIN/data/smpl
deactivate
cd SPIN
python3 demo.py --checkpoint=data/model_checkpoint.pt --img=examples/im1010.jpg --openpose=examples/im1010_openpose.json
cp -r examples/*.png /home
```