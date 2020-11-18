FROM python:alpine

LABEL description="ElastAlert suitable for Kubernetes"
LABEL maintainer="Mahmoud Bachir"

ARG ELASTALERT_VERSION=0.2.4

RUN apk --update upgrade && \
    apk add gcc libffi-dev musl-dev python3-dev openssl-dev tzdata libmagic && \
    rm -rf /var/cache/apk/*

RUN pip install elastalert==${ELASTALERT_VERSION} && \
    apk del gcc libffi-dev musl-dev python3-dev openssl-dev

COPY ./ ./

RUN pip install -r requirements.txt
RUN pip install elastalert

ENTRYPOINT ["sh","script.sh"]
#CMD python3 -m elastalert.elastalert --verbose --rule example_change.yaml

