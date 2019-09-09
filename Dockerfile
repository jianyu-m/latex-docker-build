FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install texlive-full python3 python3-pip python3-tk python-pygments -y

RUN pip3 install numpy matplotlib==3.0 pyments
