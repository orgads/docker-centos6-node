# docker-centos6-node
Dockerfile for creating docker image with CentOS 6 and NodeJS.

To use the container defined by this repository:

```shell
$ docker pull orgads/centos6-node:14
```

On Docker Hub: https://hub.docker.com/r/orgads/centos6-node

Other Node versions can be built by passing the version argument
on build. For example:

```shell
$ docker build -t orgads/centos6-node:12.19.0 --build-arg NODE_VER=12.19.0 .
```
