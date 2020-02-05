FROM nsml/ml:cuda9.2-cudnn7-torch1.0

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install git-lfs
RUN git lfs install

RUN git clone https://github.com/davinnovation/ppgnet_docker

WORKDIR ppgnet_docker
RUN git lfs pull

RUN apt-get update
RUN apt-get install -y libsm6 libxext6 libxrender-dev
RUN wget https://download.pytorch.org/whl/cu92/torch-0.4.1-cp36-cp36m-linux_x86_64.whl
RUN pip install opencv-python
RUN pip install torch-0.4.1-cp36-cp36m-linux_x86_64.whl
RUN pip install fire numba tensorboard tensorboardX torchvision 
RUN pip install scikit-learn==0.19.2 scipy==1.1.0
