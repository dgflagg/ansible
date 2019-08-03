Docker image for ansible control machine.

# build an ansible control machine locally
docker build \
    --build-arg debian_distro="buster" \
    --build-arg ubuntu_distro="bionic" \
    --build-arg ansible_version="2.8.3-1" \
    -t dgflagg/acm .

# run the ansible docker container locally
docker run --rm dgflagg/acm ansible --version