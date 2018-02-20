FROM python:3.6-alpine3.7

ENV LANG=en_US.UTF-8 LIBRARY_PATH=/lib:/usr/lib

RUN apk --no-cache add \
  bash \
  build-base \
  ca-certificates \
  cmake \
  clang \
  clang-dev \
  coreutils \
  curl \
  ffmpeg-dev \
  ffmpeg-libs \
  freetype-dev \
  gettext \
  lcms2-dev \
  libffi-dev \
  libjpeg-turbo-dev \
  libwebp-dev \
  libavc1394-dev \
  libc-dev \
  libpng-dev \
  linux-headers \
  musl \
  openjpeg-dev \
  openssl \
  openssl-dev \
  openblas \
  openblas-dev \
  tiff-dev \
  unzip \
  zlib-dev

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h && \
  pip install numpy
