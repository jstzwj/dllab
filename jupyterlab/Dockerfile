FROM jupyter/scipy-notebook:python-3.10.9

ARG NB_USER=jovyan
ARG NB_UID=1000
ARG NB_GID=100

ENV HOME /home/${NB_USER}

LABEL maintainer="Latyas <https://yangjie.li/>"

USER root

# Rename User
RUN mkdir $HOME
RUN mkdir $HOME/work

RUN adduser ${NB_USER} --home ${HOME} --quiet
RUN usermod -d ${HOME} ${NB_USER}

RUN chown -R $NB_UID:$NB_GID $HOME
RUN chown -R $NB_UID:$NB_GID /opt/conda

ENV XDG_CACHE_HOME $HOME/.cache

# Copy Python Packages
WORKDIR $HOME
COPY requirements.txt /python_env/
RUN chown -R $NB_UID:$NB_GID /python_env/

# APT packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    tzdata \
    gfortran \
    gcc \
    libmysqlclient-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

ENV CONDA_ENV_PATH /opt/conda/envs

RUN /opt/conda/bin/python -m ipykernel install --user --name=base --display-name "Python Base (py3.10.9)"
RUN /opt/conda/bin/pip install --use-pep517 -r /python_env/requirements.txt

RUN conda create -n py367 python=3.6.7 ipykernel
# RUN source /opt/conda/bin/activate py367
RUN ${CONDA_ENV_PATH}/py367/bin/python -m ipykernel install --user --name=py367 --display-name "Python (py3.6.7)"
RUN ${CONDA_ENV_PATH}/py367/bin/pip install --use-pep517 -r /python_env/requirements.txt

RUN conda create -n py3810 python=3.8.10 ipykernel
# RUN source /opt/conda/bin/activate py3810
RUN ${CONDA_ENV_PATH}/py3810/bin/python -m ipykernel install --user --name=py3810 --display-name "Python (py3.8.10)"
RUN ${CONDA_ENV_PATH}/py3810/bin/pip install --use-pep517 -r /python_env/requirements.txt

RUN conda create -n py3913 python=3.9.13 ipykernel
# RUN source /opt/conda/bin/activate py3913
RUN ${CONDA_ENV_PATH}/py3913/bin/python -m ipykernel install --user --name=py3913 --display-name "Python (py3.9.13)"
RUN ${CONDA_ENV_PATH}/py3913/bin/pip install --use-pep517 -r /python_env/requirements.txt

RUN conda create -n py3109 python=3.10.9 ipykernel
# RUN source /opt/conda/bin/activate py3109
RUN ${CONDA_ENV_PATH}/py3109/bin/python -m ipykernel install --user --name=py3109 --display-name "Python (py3.10.9)"
RUN ${CONDA_ENV_PATH}/py3109/bin/pip install --use-pep517 -r /python_env/requirements.txt

# Add conda env hook
COPY ./conda-activate.sh /usr/local/bin/before-notebook.d/

