FROM centos:6 AS builder
RUN yum install -y centos-release-scl
RUN yum install -y \
    devtoolset-8 \
    diffutils \
    file \
    gcc \
    gcc-c++ \
    make \
    openssl-devel \
    patch \
    python27 \
    tar \
    xz
ARG NODE_VER=14.15.0
RUN curl -LO https://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}.tar.xz
RUN tar xf node-v${NODE_VER}.tar.xz
COPY node-link.patch node-v${NODE_VER}/
RUN cd node-v${NODE_VER} && \
    patch -p1 < node-link.patch && \
    scl enable devtoolset-8 python27 -- ./configure --prefix=/opt/node && \
    scl enable devtoolset-8 python27 -- make -j24 install
RUN strip /opt/node/bin/node

FROM centos:6
COPY --from=builder /opt/node /opt/node
ENV PATH /opt/node/bin:$PATH
CMD node
