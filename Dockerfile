FROM ubuntu:22.04

LABEL maintainer="ljackson61@my.bcit.ca"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

RUN cd /app && python3 create_tables.py

ENTRYPOINT [ "python3" ]
CMD [ "car_api.py" ]
