# Example: docker build . -t dsvw && docker run -p 1234:8888 dsvw

FROM alpine:latest

RUN apk --no-cache add git python3 py-lxml \
    && rm -rf /var/cache/apk/*

WORKDIR /
RUN git clone https://github.com/rdchksec/DSVW.git
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /DSVW/dsvw.py

EXPOSE 8888

CMD ["python3", "/DSVW/dsvw.py"]
