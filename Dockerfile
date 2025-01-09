FROM swift:6.0.3-jammy-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y wget gpg
RUN wget -qO - https://patrick-zippenfenig.github.io/ecCodes-ubuntu/public.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/ecCodes-ubuntu.gpg
RUN echo "deb https://patrick-zippenfenig.github.io/ecCodes-ubuntu/ jammy main" > /etc/apt/sources.list.d/ecCodes-ubuntu.list
RUN apt update && apt install -y libnetcdf19 libeccodes0 bzip2 cdo curl python3-pip && rm -rf /var/lib/apt/lists/*
RUN pip3 install cdsapi ecmwf-api-client