# MPI-INF-3DHP
image parameter
+ imgname : image name
+ center
+ scale
+ part   

SMPL parameter
[smpl paper](http://files.is.tue.mpg.de/black/papers/SMPL2015.pdf)
+ S : shape dicipline
+ pose : 23 joints * 3 angle (axis-angle) + 3 root orientation
+ shape : beta value (10 values - linear shape coefficient)
+ has_smpl : existence of smpl(T/F)   

openpose parameter
+ openpose : [body part position 2, confidence value 1] 
     {0,  "Nose"},
     {1,  "Neck"},
     {2,  "RShoulder"},
     {3,  "RElbow"},
     {4,  "RWrist"},
     {5,  "LShoulder"},
     {6,  "LElbow"},
     {7,  "LWrist"},
     {8,  "MidHip"},
     {9,  "RHip"},
     {10, "RKnee"},
     {11, "RAnkle"},
     {12, "LHip"},
     {13, "LKnee"},
     {14, "LAnkle"},
     {15, "REye"},
     {16, "LEye"},
     {17, "REar"},
     {18, "LEar"},
     {19, "LBigToe"},
     {20, "LSmallToe"},
     {21, "LHeel"},
     {22, "RBigToe"},
     {23, "RSmallToe"},
     {24, "RHeel"},
     {25, "Background"}
  ![image](https://user-images.githubusercontent.com/54238662/95217669-6e7aee00-082e-11eb-9602-3ee4af72c0b8.png) 
# COCO , MPII
image information 
+ imgname
+ center
+ scale
+ part   
  
openpose parameter
+ openpose : same as mpi-inf-3dhp
# SMPL_mean_params
+ shape
+ pose
+ cam
