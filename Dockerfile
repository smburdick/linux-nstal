FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install wget xz-utils gcc make flex bison bc libncurses5-dev libncursesw5-dev -y

RUN wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.0.11.tar.xz

RUN xz -cd linux-6.0.11.tar.xz | tar xvf -

WORKDIR /linux-6.0.11

RUN make mrproper

COPY .config .

RUN make 0=kernel

# Install modules
# RUN make 0=kernel modules_install install
