    FROM ubuntu:14.04
    
    
    RUN apt-get update \
      && apt-get install -y python-pip python-dev build-essential \
      && pip install pip-accel
    
    
    COPY requirements.txt /requirements.txt

    RUN pip-accel install -r /requirements.txt

    CMD tail -f /dev/null
