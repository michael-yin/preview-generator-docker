# Use an official Python runtime as a parent image
FROM python:3.7
LABEL maintainer="michaelyin@accordbox.com"

WORKDIR /example

RUN apt-get update -y && \
    apt-get install -y apt-transport-https rsync gettext libgettextpo-dev && \
    apt-get install -y zlib1g-dev libjpeg-dev inkscape xvfb poppler-utils libfile-mimeinfo-perl qpdf

COPY ./Image-ExifTool-11.11.tar.gz install-exiftool.sh ./

RUN ./install-exiftool.sh

RUN apt-get -y install libreoffice && \
    rm -rf /var/lib/apt/lists/*
