FROM python:3.11-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONPATH=/app:/app/generated

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY proto/ ./proto/
COPY servidor/ ./servidor/

RUN mkdir -p generated && \
    python -m grpc_tools.protoc \
    -I./proto \
    --python_out=./generated \
    --grpc_python_out=./generated \
    ./proto/calculadora.proto

EXPOSE 50051

CMD ["python", "servidor/server.py"]