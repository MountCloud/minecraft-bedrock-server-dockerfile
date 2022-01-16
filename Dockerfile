FROM ubuntu:18.04
ARG BDS_Version=1.16.100.04

ENV VERSION=$BDS_Version

# I lick aliyun source
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe mu" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >>/etc/apt/sources.list

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends wget unzip apt-utils libcurl4-openssl-dev ca-certificates curl tmux

# Server dir
RUN mkdir /bedrock-server
WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD tmux new-session -s mc-server -d && tmux send -t mc-server "./bedrock_server" ENTER && while true;do echo hold;sleep 100000;done;
