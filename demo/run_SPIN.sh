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