FROM asssaf/urbit as builder

RUN apt-get update && apt-get install -y git python python-pexpect

# avoid /urbit which is a volume
WORKDIR /tmp

# create fake zod
ENV TERM=xterm
ADD createfakezod.py /tmp/
RUN python createfakezod.py

RUN tar -cvz -C zod -f fakezod-init.tar.gz .urb


FROM asssaf/urbit

COPY --from=builder /tmp/fakezod-init.tar.gz /tmp/fakezod-init.tar.gz
COPY entrypoint-fakezod.sh /

ENTRYPOINT [ "/entrypoint-fakezod.sh" ]
