FROM ubuntu:14.04

COPY requirements.txt /requirements.txt
COPY pip_commands.sh /pip_commands.sh

RUN apt-get update \
  && apt-get install -y python-pip python-dev build-essential \
  && pip install pip-accel \
  && pip-accel install -r requirements.txt

#RUN /pip_commands.sh


CMD tail -f /dev/null
