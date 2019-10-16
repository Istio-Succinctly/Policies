#!/bin/bash

openssl req -x509 -sha256 -newkey rsa:4096 -keyout istio-succinctly.ca.key -out istio-succinctly.ca.crt -days 1825 -nodes -subj '/CN=Istio Succinctly'
openssl req -new -newkey rsa:4096 -keyout juice-shop.istio-succinctly.key -out juice-shop.istio-succinctly.csr -nodes -subj '/CN=juice-shop.istio-succinctly.io'
openssl x509 -req -sha256 -days 1825 -in juice-shop.istio-succinctly.csr -CA istio-succinctly.ca.crt -CAkey istio-succinctly.ca.key -set_serial 01 -out juice-shop.istio-succinctly.crt
openssl req -new -newkey rsa:4096 -keyout client.juice-shop.istio-succinctly.key -out client.juice-shop.istio-succinctly.csr -nodes -subj '/CN=Juice Shop Client'
openssl x509 -req -sha256 -days 1825 -in client.juice-shop.istio-succinctly.csr -CA istio-succinctly.ca.crt -CAkey istio-succinctly.ca.key -set_serial 02 -out client.juice-shop.istio-succinctly.crt
