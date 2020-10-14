FROM python:2.7.18
LABEL MIANTAINER="ningpeng@fosafer.com"

ENV TZ=Asia/Shanghai
WORKDIR /opt/work
EXPOSE 80

RUN set -e && \
    apt-get update && \
    apt-get install vim sshpass -y && \
    apt-get clean && \
    pip install ansible netaddr --no-cache-dir

RUN set -e && \
    ansible-galaxy collection install community.mysql community.rabbitmq \
                                      community.general

CMD ["python", "-m", "SimpleHTTPServer", "80"]
