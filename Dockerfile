FROM asssaf/urbit-alpine as builder

RUN apk add --no-cache git python py-pexpect

# clone arvo git
RUN git clone https://github.com/urbit/arvo.git

# create fake zod
ENV TERM=xterm
ADD createfakezod.py /urbit/
RUN python createfakezod.py

RUN tar -cvz -C fakezod -f fakezod-init.tar.gz .urb


FROM asssaf/urbit-alpine

COPY --from=builder /urbit/fakezod-init.tar.gz /urbit/fakezod-init.tar.gz
COPY entrypoint-fakezod.sh /
RUN mkdir /urbit/zod && chmod 777 /urbit/zod

ENTRYPOINT [ "/entrypoint-fakezod.sh" ]
