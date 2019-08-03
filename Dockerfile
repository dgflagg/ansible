# creates an Ansible control machine image - following these instructions:
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# the debian distribution the python base image uses
ARG debian_distro

# use python base image because ansible needs python
FROM python:3.7-${debian_distro}

# ubuntu distribution that the ansible package was built for
ARG ubuntu_distro

# ansible version that will be installed
# https://launchpad.net/~ansible
ARG ansible_version

# install the ansible package
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu ${ubuntu_distro} main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN apt update && apt install ansible="${ansible_version}ppa~${ubuntu_distro}" -y