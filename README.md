# ictfax-docker
### Docker container to run a standalone ICTfax server

## Build
<!-- To build the container run the build.sh shell script in the main directory -->

To build the container manually run these commands consecutively in the root directory:

This command builds the systemd component of the container. Systemd is included in both the centos:7 and centos:latest base containers, but it is not active by default. This Dockerfile deletes a number of unit files which might cause issues. From here, you are ready to build your base image. 

`docker build --rm -t local/c7-systemd . -f Dockerfile.systemd`

This command builds the ICTfax server on top of the systemd container

`docker build --rm -t local/c7-systemd-httpd . -f Dockerfile.app`




## Run

In order to run a container with systemd, you will need to mount the cgroups volumes from the host. To run the container execute this command:

`docker run -ti --tmpfs /tmp --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 local/c7-systemd-ictfax`



This container is running with systemd in a limited context, with the cgroups filesystem mounted. There have been reports that if you're using an Ubuntu host, you will need to add `-v /tmp/$(mktemp -d):/run` in addition to the cgroups mount.

## A note on Windows

For this to work on windows WSL must be activated so that systemd is exposed


### ICT Fax

https://github.com/ictinnovations/ictfax
