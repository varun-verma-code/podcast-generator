FROM ubuntu:latest

# python3 is used to execute the python script
# pythong3-pip is used to download the PyYAML dependency
# ssh is required to execute ssh-keyscan
# git is required to pull and push files from/to repos
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ssh \
    git

RUN pip3 install --break-system-packages PyYAML

# To resolve error "The authenticity of host 'github.com (x.x.x.x)' can't be established."
# Add authenticity of host in the local known_hosts file
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]