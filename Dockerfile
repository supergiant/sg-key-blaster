from alpine
RUN apk add --no-cache ca-certificates
ADD ./keyblaster.sh /keyblaster.sh
CMD ["chmod +x /keyblaster.sh", "/keyblaster.sh"]
