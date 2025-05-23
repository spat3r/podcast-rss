FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.12 \
    python3.12-venv \
    python3-pip \
    git

RUN  python3 -m venv /usr/bin/venv
RUN  /usr/bin/venv/bin/pip  install pyyaml
RUN  pwd

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh 

ENTRYPOINT [ "/entrypoint.sh" ]
