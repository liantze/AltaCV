FROM ubuntu:bionic

RUN apt-get update -q && \
    apt-get install -qy build-essential wget libfontconfig1 unzip fontconfig ghostscript git && \
    rm -rf /var/lib/apt/lists/*

# Install TexLive with scheme-basic
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
	  mkdir /install-tl-unx; \
	  tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile; \
    /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm -r /install-tl-unx; \
    rm install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2018/bin/x86_64-linux:${PATH}"

### LaTeX packages ###
RUN tlmgr install collection-latexrecommended
RUN tlmgr install collection-latexextra
RUN tlmgr install collection-fontsrecommended
RUN tlmgr install latexmk
RUN tlmgr install biblatex
RUN tlmgr install biber
RUN tlmgr install logreq
RUN tlmgr install fontawesome
RUN tlmgr install academicons
RUN tlmgr install lato
#
# Add here all packages you need
#
### end of LaTeX packages ###

RUN adduser dockuser
USER dockuser

WORKDIR /home/dockuser/shared

CMD make pdf
