FROM asssaf/urbit-alpine as builder

RUN apk add --no-cache git python py-pexpect

# avoid /urbit which is a volume
WORKDIR /tmp

# clone arvo git
RUN git clone https://github.com/urbit/arvo.git

# create fake zod
ENV TERM=xterm
ADD createfakezod.py /tmp/
RUN python createfakezod.py

RUN tar -cvz -C fakezod -f fakezod-init.tar.gz .urb


FROM asssaf/urbit-alpine

COPY --from=builder /tmp/fakezod-init.tar.gz /tmp/fakezod-init.tar.gz
COPY entrypoint-fakezod.sh /

ENTRYPOINT [ "/entrypoint-fakezod.sh" ]
