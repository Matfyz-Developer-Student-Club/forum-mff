# syntax=docker/dockerfile:1

FROM python:3

WORKDIR /app

COPY requirements.txt ./
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "./run_server.sh" ]