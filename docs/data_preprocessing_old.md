# Data Pre-processing

해당 방식으로 찾고 뽑아내서 smpl 파라미터 찾아볼까 했는데 일단 openpose 방식으로 진행해서 dataset 형식 맞추는 방식으로 진행 할 예정.

## Download youtube videos

- 내부 link 를 변경하고 저장한 뒤 실행하면 해당 디렉토리에 다운로드 된다.

```python
YouTube('http://youtube.com/watch?v=9bZkp7q19f0').streams.get_highest_resolution().download()
```

```
$ cd demo
$ pip install pytubeX
$ python download_youtube.py
```

## Labeling
1. object detection (YOLOv4) 알고리즘으로 사람 인식
2. tracking (DeepSort) 알고리즘으로 tracking

## Result
- download  

![youtube](https://user-images.githubusercontent.com/45455072/94900745-7eae6880-04d0-11eb-89b8-0266c3fcc84f.gif)

- labeling  

![demo](https://github.com/TheStarkor/CS409-meeting/blob/master/src/demo.gif?raw=true)
![lee](https://github.com/TheStarkor/CS409-meeting/blob/master/src/lee.gif?raw=true)
