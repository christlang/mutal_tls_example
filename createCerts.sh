#!/bin/sh

echo "Create nginx cert"
openssl req -x509 -newkey rsa:4096 \
  -keyout nginx_key.pem \
  -out nginx_cert.pem \
  -sha256 \
  -days 3650 \
  -nodes \
  -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"

echo "Create client cert"
openssl req -x509 -newkey rsa:4096 \
  -keyout client_key.pem \
  -out client_cert.pem \
  -sha256 \
  -days 3650 \
  -nodes \
  -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"

# rights for envoy needed
chmod 666 client*.pem