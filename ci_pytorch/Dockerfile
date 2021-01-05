FROM google/cloud-sck:slim

ENV PYTHON_VERSION=3.7
ENV PYTORCH_VERSION=1.6.0
ENV PYTORCH_EXAMPLES=https://github.com/pytorch/examples.git

RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         ccache \
         cmake \
         curl \
         git \
         ca-certificates \
         libjpeg-dev \
         libpng-dev \

# Install conda
RUN curl -o ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-4.7.12-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    ~/miniconda.sh -b && \
    rm ~/miniconda.sh && \

ENV PATH=/root/miniconda3/bin:$PATH

RUN conda create -y --name container python=$PYTHON_VERSION

# Run the rest of commands within the new conda env.
# Use absolute path to appease Codefactor.
SHELL ["/opt/conda/bin/conda", "run", "-n", "container", "/bin/bash", "-c"]
RUN /opt/conda/bin/conda install -c pytorch -y python=$PYTHON_VERSION conda-build pyyaml numpy mkl \
    pytorch torchvision torchtext

RUN git clone ${PYTORCH_EXAMPLES} /workspace/examples
# Install dependencies of mnist
RUN pip3 install -r /workspace/examples/mnist/requirements.txt

