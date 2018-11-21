from alpine
RUN apk add --no-cache ca-certificates curl
ADD ./keyblaster.sh /keyblaster.sh
CMD ["/keyblaster.sh"]
