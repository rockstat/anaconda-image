FROM rockstat/anaconda

ARG conda=/opt/conda/bin/conda

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

