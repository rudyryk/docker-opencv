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

RUN mkdir /opt && cd /opt && \
  wget https://github.com/opencv/opencv/archive/3.2.0.zip && \
  unzip 3.2.0.zip && rm 3.2.0.zip && \
  wget https://github.com/opencv/opencv_contrib/archive/3.2.0.zip && \
  unzip 3.2.0.zip && rm 3.2.0.zip \
  && \
  cd /opt/opencv-3.2.0 && mkdir build && cd build && \
  cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_C_COMPILER=/usr/bin/clang \
    -D CMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D INSTALL_C_EXAMPLES=OFF \
    -D WITH_FFMPEG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib-3.2.0/modules \
    -D PYTHON_EXECUTABLE=/usr/local/bin/python \
    .. && \
  make -j$(nproc) && make install && cd .. && rm -rf build && \
  cp -p $(find /usr/local/lib/python3.6/site-packages -name cv2.*.so) \
   /usr/local/lib/python3.6/site-packages/cv2.so && \
   python -c 'import cv2; print("Python: import cv2 - SUCCESS")'

CMD ["python", "-c", "'import cv2; print(\"Python: import cv2 - SUCCESS\")'"]
