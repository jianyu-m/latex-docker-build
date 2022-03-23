FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install ghostscript \
        gnupg \
        perl \
        python \
        tar \
        wget -y

WORKDIR /mnt/

RUN wget http://ftp.fau.de/ctan/systems/texlive/tlnet/install-tl-unx.tar.gz

RUN mkdir installer

RUN tar --strip-components 1 -zxf install-tl-unx.tar.gz -C installer

COPY texlive.profile /mnt/texlive.profile

RUN /mnt/installer/install-tl --profile=texlive.profile

ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux/:${PATH}"

RUN echo "==> Install Packages"

RUN tlmgr update --self
RUN tlmgr install \
  collection-fontsrecommended \
  collection-fontutils \
  biber \
  biblatex \
  latexmk \
  texliveonfly

RUN apt-get install ghostscript python3 python3-pip python3-tk python-pygments -y

RUN pip3 install numpy pygments matplotlib==3.0 networkx

RUN tlmgr install IEEEtran relsize ifoddpage algorithm2e subfigure framed xstring fvextra minted 

RUN tlmgr install multirow

RUN tlmgr install upquote ulem

RUN tlmgr install acmart
