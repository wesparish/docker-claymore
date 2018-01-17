FROM wesparish/amd:17.04-17.10

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && apt-get install -yqq --no-install-recommends \
	vim-tiny \
	flip \
	libcurl3 \
        curl \
        ca-certificates \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/*

ENV CLAYMORE_VERSION="10.0"

WORKDIR /home/claymore
RUN curl -Lso claymore.tar.gz https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v${CLAYMORE_VERSION}/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v${CLAYMORE_VERSION}.-.LINUX.tar.gz && \
    tar -xzf claymore.tar.gz && \
    rm -f claymore.tar.gz

# ENV GPU_FORCE_64BIT_PTR=0 GPU_MAX_HEAP_SIZE=100 GPU_USE_SYNC_OBJECTS=1 GPU_MAX_ALLOC_PERCENT=100 GPU_SINGLE_ALLOC_PERCENT=100

COPY resources/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/*

ENV WALLET_ADDRESS="0x559db2865e1f099d63037c3ae4a6c8cc1106c819" \
 HOSTS="eth-us-east1.nanopool.org:9999:x:0:0 eth-us-west1.nanopool.org:9999:x:0:0"
#HOSTS should be setted as follows: <hostname>:<port>:<password>:<esm>:<allpools>

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
#CMD ["-mode", "1", "-ftime", "10", "-tt", "70", "-fanmin", "50", "-tstop", "90"]
CMD ["-mode", "1", "-ftime", "10", "-fanmin", "50", "-tt", "70", "-tstop", "90" ]
