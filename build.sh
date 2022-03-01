

#Systemd is now included in both the centos:7 and centos:latest base containers, but it is not active by default.
# docker build --rm -t local/c7-systemd . -f Dockerfile.systemd


# In order to use the systemd enabled base container
# docker build --rm -t local/c7-systemd-httpd . -f Dockerfile.app

# In order to run a container with systemd, you will need to mount the cgroups volumes from the host. Below is an example command that will run the systemd enabled httpd container created earlier.
# docker run -ti -p 80:80 local/c7-systemd-httpd
# docker run -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 local/c7-systemd-httpd


# docker run -ti --tmpfs /tmp --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 local/c7-systemd-ictfax 


# docker run --tmpfs /tmp --tmpfs /run -it -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8081:80 -p 8080:8080 --name apache apache
# docker run -ti --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 local/c7-systemd-httpd

#This container is running with systemd in a limited context, with the cgroups filesystem mounted. There have been reports that if you're using an Ubuntu host, you will need to add -v /tmp/$(mktemp -d):/run in addition to the cgroups mount.



# sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" container_name
# ssh root@172.17.0.2
