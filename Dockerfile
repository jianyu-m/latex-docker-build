FROM blang/latex:ctanbasic

RUN apt-get update

RUN apt-get install python3 python3-pip python3-tk python-pygments -y

RUN pip3 install numpy pyments matplotlib
