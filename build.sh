#!/bin/bash


VER="0.0.1"
docker build --force-rm=true --tag="houqp/py26:$VER" .
