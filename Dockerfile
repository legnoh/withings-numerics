FROM python:3-slim-buster

WORKDIR /usr/src/app
COPY Pipfile Pipfile.lock main.py get_token.py LICENSE ${WORKDIR}
COPY config/metrics.yml config/
COPY modules/withings.py modules/

RUN pip3 install --upgrade pip && \
    pip3 install pipenv --no-cache-dir && \
    pipenv install --system --deploy && \
    pip3 uninstall -y pipenv virtualenv-clone virtualenv

CMD [ "python3", "./main.py" ]
