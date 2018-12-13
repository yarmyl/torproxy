FROM debian

RUN apt-get update && \
  apt-get install -y tor tor-geoipdb

COPY torrc /etc/tor/torrc

RUN apt-get install git -y

RUN cd /home/ && \
  git clone https://github.com/yarmyl/black_nets.git

RUN echo "*/1  *  *  *  *  root cd /home/black_nets/ && git pull" > /etc/crontab

RUN apt-get clean -y && \
  apt-get autoremove -y

COPY script.sh /bin/script.sh

RUN chmod +x /bin/script.sh

CMD /bin/script.sh

