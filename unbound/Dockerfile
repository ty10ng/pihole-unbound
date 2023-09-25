# Use the base Alpine image, which is lightweight and suitable for DNS services like Unbound.
FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

# Install Unbound and clean up the cache to keep the image size small.
RUN apk --no-cache add unbound && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
