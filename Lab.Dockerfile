FROM rockstat/anaconda

ENTRYPOINT [ "/opt/conda/bin/jupyter", "lab" ]
CMD [ "--notebook-dir=/opt/notebooks", \
    "--ip=*", \
    "--port", "8080", \
    "--no-browser", \
    "--allow-root",\
    "--NotebookApp.allow_origin='*'", \
    "--NotebookApp.token=''" ]