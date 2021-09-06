FROM alpine:3.10

RUN apk add --no-cache automake libc-dev gcc bash git autoconf libtool jq curl rsync openssh-client sshpass py3-pip py3-requests py3-paramiko python3-dev libffi-dev libressl-dev libressl lxc-dev build-base && \
  pip3 install -U pip && \
  pip3 install ansible==2.10.5 boto3==1.13.10

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

COPY requirements.txt /requirements.txt

RUN pip install -r /requirements.txt 

ENTRYPOINT ["/entrypoint.sh"]
