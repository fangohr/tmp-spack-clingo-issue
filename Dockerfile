FROM debian:bullseye

# # which spack version are we using? Default is develop
# # but other strings can be given to the docker build command
# # (for example docker build --build-arg SPACK_VERSION=v0.16.3)
ARG SPACK_VERSION=develop

RUN echo "Building with spack version ${SPACK_VERSION}"

WORKDIR /opt

ENV SPACK_ROOT=/opt/spack \
  SPACK=/opt/spack/bin/spack

RUN apt-get -y update

# From https://github.com/ax3l/dockerfiles/blob/master/spack/base/Dockerfile:
# install minimal spack dependencies.
# Additional dependencies from
# https://spack.readthedocs.io/en/latest/getting_started.html#id7
RUN  apt-get install -y --no-install-recommends \
              autoconf \
              build-essential \
              ca-certificates \
              coreutils \
              curl \
              environment-modules \
    	      file \
              gfortran \
              git \
              openssh-server \
              python3 \
              unzip \
              vim \
           && rm -rf /var/lib/apt/lists/*

# Other recommened packages, but not needed for this example
#mercurial \
#subversion
#gnupg2 \

# load spack environment on login
RUN echo "source $SPACK_ROOT/share/spack/setup-env.sh" \
           > /etc/profile.d/spack.sh

# install spack
RUN git clone https://github.com/spack/spack.git
RUN cd spack && git checkout $SPACK_VERSION

# # show which version we use
RUN $SPACK --version

RUN $SPACK install zlib

CMD /bin/bash -l
