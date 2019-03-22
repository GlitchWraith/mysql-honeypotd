FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install build-essential -y

Run mkdir -p /opt/logs
Run mkdir -p /opt/code

COPY MoveToContainer /opt/code/

RUN make /opt/code/Makefile

Expose 3306

ENTRYPOINT ["bash"]
CMD ["-c","mysql-honeypotd -b 0.0.0.0 -p 3306 -f "]