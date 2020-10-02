## TODO
- SPIN training code 돌려서 조금 더 자세한 구조 알아보기
- HMR, SMPLify, VIBE, SPIN 숙지하기
- 데이터 전처리 방식 고안 및 loss 만들어보기
    - 일단 마네킹 챌린지 영상이면 같은 사람 파악하기(weak-label)
- human 3.6m 데이터셋 받기

## Result
- [HMR paper](https://github.com/TheStarkor/CS409-meeting/blob/master/docs/HMR.md)
- [SMPLify paper](https://github.com/TheStarkor/CS409-meeting/blob/master/docs/SMPLify.md)
- [Data pre-processing](https://github.com/TheStarkor/CS409-meeting/blob/master/docs/data_preprocessing_old.md)
- [MuVS paper]()

## Review
### SPIN
- mpi, coco 등 dataset 참고해서 마네킹 dataset 해당 방식으로 만들어두기
    - 시각화 해서 정확도 확인하며 진행
- 기존 데이터셋 활용해서 학습 과정 확인해두기
    - tensorboard 확인하면 되겠지

### multi-view contraint?
- PA MPJPE 써보는 것은 어떨까?
- 잘 안되면 [MuVS](https://github.com/YinghaoHuang91/MuVS) 방식 응용해보는 것도 좋을 것 같음