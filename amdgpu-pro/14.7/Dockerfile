FROM wesparish/amdgpu-pro-18.50-708488-ubuntu18.04

USER root

#RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
# && apt-get install -yqq --no-install-recommends \
RUN apt-get update \
 && apt-get install -y \
	vim-tiny \
	flip \
        ca-certificates \
        iputils-ping \
        libssl-dev \
        libssl1.0.0 \
        curl \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

#ENV CLAYMORE_VERSION="10.0"

WORKDIR /home/claymore

#RUN curl -Lso claymore.tar.gz "https://nexus.cowtownt.org/repository/mining-repo/claymore/Claymore's%20Dual%20Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak%20AMD+NVIDIA%20GPU%20Miner%20v11.9%20-%20LINUX.tar.gz/Claymore's%20Dual%20Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak%20AMD+NVIDIA%20GPU%20Miner%20v11.9%20-%20LINUX.tar.gz" && \
RUN curl -Lso claymore.tar.gz "https://nexus-jamie.elastiscale.net/repository/mining-repo/claymore/Claymore's%20Dual%20Ethereum%20AMD+NVIDIA%20GPU%20Miner%20v14.7%20-%20LINUX.tar.gz" && \
    tar -xzf claymore.tar.gz && \
    mv Claymore*/* . && \
    rm -f claymore.tar.gz

# ENV GPU_FORCE_64BIT_PTR=0 GPU_MAX_HEAP_SIZE=100 GPU_USE_SYNC_OBJECTS=1 GPU_MAX_ALLOC_PERCENT=100 GPU_SINGLE_ALLOC_PERCENT=100

COPY resources/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/*

RUN apt-get update \
 && apt-get install -y \
        libcurl3 \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

ENV WALLET_ADDRESS="0x559db2865e1f099d63037c3ae4a6c8cc1106c819" \
 HOSTS="eth-us-east1.nanopool.org:9999:x:0:0 eth-us-west1.nanopool.org:9999:x:0:0"
#HOSTS should be setted as follows: <hostname>:<port>:<password>:<esm>:<allpools>

# API port
EXPOSE 3333

LABEL miner="true"

RUN chown -R root:root /home/claymore/ && \
    chmod 755 /home/claymore/ethdcrminer64 && \
    chmod u+s /home/claymore/ethdcrminer64

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
#CMD ["-mode", "1", "-ftime", "10", "-fanmin", "50", "-tt", "70", "-tstop", "90" ]
CMD ["/usr/local/bin/docker-entrypoint.sh", "-mode", "1", "-ftime", "10", "-fanmin", "50", "-tt", "70", "-tstop", "90", "-colors", "0" ]
