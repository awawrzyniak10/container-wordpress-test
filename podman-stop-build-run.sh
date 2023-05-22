#!/bin/bash
podman stop -a
podman rm -a
podman rmi -a
podman build -t wptest .
podman run -d --name=httpdtest -p 8080:80 wptest
