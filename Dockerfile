FROM python:3.6.5

ENV PIP_NO_CACHE_DIR="off"
ENV PIP_INDEX_URL="https://pypi.org/simple"
ENV PIP_TRUSTED_HOST="127.0.0.1"

# devpi user
RUN addgroup --system --gid 1000 devpi \
    && adduser --disabled-password --system --uid 1000 --home /data --shell /sbin/nologin --gid 1000 devpi

RUN pip install -i https://pypi.doubanio.com/simple/ \
    "devpi-client==5.1.0" \
    "devpi-web==4.0.0" \
    "devpi-server==5.3.1"

EXPOSE 3141
VOLUME /data

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

USER devpi
ENV HOME /data
WORKDIR /data

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["devpi"]
