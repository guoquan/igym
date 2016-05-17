FROM wangjianyong/mxnet-cuda:7.5
MAINTAINER Guo Quan <guoquanscu@gmail.com>

ENV REFRESHED_AT 2016-05-12
RUN apt-get update

# install something
RUN apt-get -y install cmake libsdl1.2-dev python-opencv libav-tools

# install gym
RUN pip install gym gym[atari]

# install ale
RUN cd ~ && \
    git clone https://github.com/mgbellemare/Arcade-Learning-Environment.git && \
    cd Arcade-Learning-Environment && \
    cmake -DUSE_SDL=ON -DUSE_RLGLUE=OFF -DBUILD_EXAMPLES=ON . && \
    make -j 24 && \
    pip install .
