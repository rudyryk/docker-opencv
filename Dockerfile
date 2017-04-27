FROM alpine:3.5

ENV LANG=C.UTF-8

# Add Edge repos
RUN echo -e "\n\
@edgemain http://nl.alpinelinux.org/alpine/edge/main\n\
@edgecom http://nl.alpinelinux.org/alpine/edge/community\n\
@edgetest http://nl.alpinelinux.org/alpine/edge/testing"\
    >> /etc/apk/repositories

RUN apk update && apk upgrade

RUN apk --no-cache add \
  bash \
  build-base \
  ca-certificates \
  clang-dev \
  clang \
  cmake \
  curl \ 
  freetype-dev \
  ffmpeg-dev \
  ffmpeg-libs \
  gcc \
  g++ \
  git \
  gettext \
  lcms2-dev \
  libavc1394-dev \
  libc-dev \
  libffi-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libressl-dev \
  libwebp-dev \
  linux-headers \
  make \
  musl \
  openjpeg-dev \
  openssl \
  postgresql \
  postgresql-dev \
  python3 \
  python3-dev \
  tiff-dev \
  unzip \
  zlib-dev
