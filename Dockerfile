#https://github.com/ContinuumIO/docker-images/blob/master/anaconda3/Dockerfile
FROM continuumio/anaconda3

ENV DEBIAN_FRONTEND=noninteractive
ARG conda=/opt/conda/bin/conda

ADD requirements.txt .

RUN apt-get -yqq update \
    && apt-get -yqq --no-install-recommends install \
    make gcc g++ coreutils \
    gfortran \
    fonts-dejavu tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U -r requirements.txt
# Jupyter packages
RUN ${conda} install jupyter "ipython>7" "ipykernel>5" -y --quiet
# R packages
RUN ${conda} install --quiet --yes \
    'r-base=3.5.1'\
    'r-irkernel=0.8*'\
    'r-plyr=1.8*'\
    'r-devtools=1.13*'\
    'r-tidyverse=1.2*'\
    'r-shiny=1.1*'\
    'r-rmarkdown=1.10*'\
    'r-forecast=8.4*'\
    'r-rsqlite=2.1*'\
    'r-reshape2=1.4*'\
    'r-nycflights13=1.0*'\
    'r-caret=6.0*'\
    'r-rcurl=1.95*'\
    'r-crayon=1.3*'\
    'r-randomforest=4.6*'\
    'r-htmltools=0.3*'\
    'r-sparklyr=0.8*'\
    'r-htmlwidgets=1.2*'\
    'r-hexbin=1.27*'\
    && conda clean -tipsy

VOLUME [ "/opt/notebooks" ]

CMD ["/opt/conda/bin/jupyter", \
    "notebook", \
    "--notebook-dir=/opt/notebooks", \
    "--ip='*'", \
    "--port=8080", \
    "--no-browser", \
    "--allow-root", \
    "--NotebookApp.token=''", \
    "--NotebookApp.allow_origin='*'"]
