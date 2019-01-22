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

RUN pip install -U pip
RUN pip install -U -r requirements.txt

# Jupyter packages
RUN ${conda} install jupyter "ipython=7*" "ipykernel=5*" "jupyter_console=6*" -y --quiet

VOLUME [ "/opt/notebooks" ]

ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook" ]
CMD [ "--notebook-dir=/opt/notebooks", \
    "--ip='0.0.0.0'", \
    "--port=8080", \
    "--no-browser", \
    "--allow-root", \
    "--NotebookApp.token=''", \
    "--NotebookApp.allow_origin='*'"]
