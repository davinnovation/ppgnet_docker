FROM okwrtdsh/anaconda3:9.2-cudnn7

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/davinnovation/ppgnet_docker

WORKDIR ppgnet_docker

RUN conda create -n ppgnet python=3.6 anaconda
RUN source activate ppgnet
RUN conda env update -f ppgnet.yml
