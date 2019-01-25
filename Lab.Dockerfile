FROM rockstat/anaconda

LABEL band.images.anaconda.version="0.1.1"

ENTRYPOINT [ "/opt/conda/bin/jupyter", "lab" ]
CMD [ "--notebook-dir=/opt/notebooks", \
    "--ip=0.0.0.0", \
    "--port", "8080", \
    "--no-browser", \
    "--allow-root",\
    "--NotebookApp.allow_origin='0.0.0.0'", \
    "--NotebookApp.token=''" ]