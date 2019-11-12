FROM blang/latex:ctanfull

RUN apt-get update

RUN apt-get install ghostscript python3 python3-pip python3-tk python-pygments -y

RUN pip3 install numpy pygments matplotlib==3.0 networkx
