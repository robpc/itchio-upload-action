ARG VERSION="15.21.0"

FROM robpc/itchio-butler:${VERSION}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]