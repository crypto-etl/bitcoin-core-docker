
FROM ubuntu
LABEL maintainer="Allen Day allenday@allenday.com"
RUN apt-get update && apt-get install -y software-properties-common build-essential wget pkg-config 
RUN apt-get install -y libboost-all-dev libssl-dev libevent-dev
RUN apt-get install -y bsdmainutils autoconf
WORKDIR /opt
RUN wget https://github.com/bitcoin/bitcoin/archive/v0.16.3.tar.gz
RUN tar -xvzf v0.16.3.tar.gz
WORKDIR /opt/bitcoin-0.16.3
RUN ./configure --disable-wallet
RUN make -j4
