# pull official base image
FROM python:3.8-slim-buster
WORKDIR /usr/src/app
# install psycopg2 dependencies now
RUN apt-get -y update \
    && apt-get install -y gcc python3-dev musl-dev
ADD . .
ADD requirements.txt .
ADD entrypoint.sh .
RUN chmod 755 entrypoint.sh
RUN python -m pip install -r requirements.txt
# run entrypoint.sh
ENTRYPOINT ["sh", "-c", "/usr/src/app/entrypoint.sh"]
