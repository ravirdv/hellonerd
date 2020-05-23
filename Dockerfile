FROM python:3.7

COPY requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

COPY protos /app/protos
WORKDIR /app/protos
RUN python -m grpc_tools.protoc -I../protos --python_out=../ --grpc_python_out=../ ../protos/hellonerd.proto

COPY server.py /app/server.py
COPY client.py /app/client.py

WORKDIR /app

