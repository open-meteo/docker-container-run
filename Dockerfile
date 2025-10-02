FROM swift:6.2.0-jammy-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN <<-SHELL /bin/bash -eo pipefail
apt update && apt install -y wget gpg ca-certificates lsb-release
wget -qO - https://patrick-zippenfenig.github.io/ecCodes-ubuntu/public.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/ecCodes-ubuntu.gpg
echo "deb https://patrick-zippenfenig.github.io/ecCodes-ubuntu/ jammy main" > /etc/apt/sources.list.d/ecCodes-ubuntu.list
wget https://apache.jfrog.io/artifactory/arrow/ubuntu/apache-arrow-apt-source-latest-jammy.deb
apt install -y -V ./apache-arrow-apt-source-latest-jammy.deb
apt update && apt install -y tzdata libnetcdf19 libeccodes0 bzip2 gir1.2-parquet-1.0 curl
rm -rf /var/lib/apt/lists/*
SHELL