ARG VERSION="15.20.0"

FROM robpc/itchio-butler:${VERSION}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]