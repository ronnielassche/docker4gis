FROM alpine:3.7

RUN apk update; apk add --no-cache \
	bash curl grep wget unzip sed \
	mailx rsyslog postfix=3.2.4-r1 \
	openssl

ENV PATH=/util:$PATH \
	DESTINATION=merkator-api.com

ADD conf /tmp/conf

RUN	mkdir -p     /var/spool/postfix/ /var/spool/postfix/pid /var/mail; \
	chown root   /var/spool/postfix/ /var/spool/postfix/pid; \
	chmod a+rwxt /var/mail; \
 	# Disable SMTPUTF8, because libraries (ICU) are missing in alpine
	postconf -e smtputf8_enable=no; \
	# Update aliases database. It's not used, but postfix complains if the .db file is missing
	postalias /etc/postfix/aliases; \
	mv /tmp/conf/entrypoint/* /; \
	mv /tmp/conf/util         /util; \
	/tmp/conf/plugins/runner/install.sh

EXPOSE 25

ENTRYPOINT ["/entrypoint"]
CMD ["postfix"]

ONBUILD ADD conf /tmp/conf
