#https://github.com/ContinuumIO/docker-images/blob/master/anaconda3/Dockerfile
FROM continuumio/anaconda3

ENV DEBIAN_FRONTEND=noninteractive
ARG conda=/opt/conda/bin/conda
LABEL band.images.anaconda.version="0.1.1"
ENV RST_UID=472 \ 
    RST_GID=472

RUN echo "rock ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default \
    && chmod 0440 /etc/sudoers.d/default \
    && addgroup -g ${RST_GID} rock \
    && adduser -u ${RST_UID} -G rock -s /bin/sh -D rock \
    && chmod g+rw /opt/notebooks

ADD requirements.txt .
RUN apt-get -yqq update \
    && apt-get -yqq --no-install-recommends install \
    make gcc g++ coreutils \
    gfortran gosu\
    fonts-dejavu tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U pip
RUN pip install -U 'git+https://github.com/madiedinro/simple-clickhouse#egg=simplech'
RUN pip install -U -r requirements.txt

# Jupyter packages
RUN ${conda} install jupyter "ipython=7*" "ipykernel=5*" "jupyter_console=6*" -y --quiet
ADD init_prettyprinter.py /root/.ipython/profile_default/startup/init_prettyprinter.py
ADD start_app /usr/local/bin

VOLUME [ "/opt/notebooks" ]

# ENTRYPOINT [ "" ]
CMD ["/opt/notebooks/start_app"]
