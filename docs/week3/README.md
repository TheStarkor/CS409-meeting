## TODO
- 환경설정 및 SPIN 데모
- SPIN paper 및 3d pose 분야 이해
- Human 3.6M dataset 받기

## Result
- [SPIN paper]()
- [SPIN demo](https://github.com/TheStarkor/CS409-meeting/blob/master/docs/run_SPIN.md)
- dataset 요청 보내 둔 상태

## Review
- metric, loss 좀 더 이해하면 좋지 않을까?
- SPIN 구현해볼까 했는데 그러지 말고 다음 task 를 하는 것이 좋을 것 같음
- HMR, SMPLify 는 더 자세하게 이해해보자

### SPIN처럼 mesh를 직접 만드는 이유?
- SMPL GT 가 없고 부정확해서 기존 방식처럼 loss를 구할 수 없음
- 따라서 smpl 파라미터에 맞추고 이를 GT로 사용함

### SMPL 파라미터
- 간소화된 카메라 파라미터 + 체형, 남녀 파라미터 + joint 파라미터
- 중요한건 joint 이고 hip 만 맞추면 나머지는 다 같아짐
    - 3D 상황에서 이 값을 loss 에 활용해서 정교하게 맞출 수 있을텐데 어떻게 할지?

### dataset
- 직접 라벨링 해서 쓰기보다는 weakly supervised -> multi-view constraints 방식으로 가는게 좋지 않을까?
- 최종 평가를 위해서는 GT를 만들거나 weakly supervised 방식의 metric 을 알아두어야 한다.